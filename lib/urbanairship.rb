require 'json'
require 'net/https'
require 'time'

module Urbanairship
  begin
    require 'system_timer'
    Timer = SystemTimer
  rescue LoadError
    require 'timeout'
    Timer = Timeout
  end

  APPLICATION_KEY = '7qbT_tnhR7m9pgaKNolPfg'
  APPLICATION_SECRET = 'K8LVrFnNRe2x_d1HdXn_LQ'
  MASTER_SECRET = 'ElUXZUI7RAq4_i498x0rjw'
  ##TEST IPhone app
  #APPLICATION_KEY = 'GrdmcPZoS9CzX8WSLcDBTg'
  #APPLICATION_SECRET = 'jIXZl0XRRlSe7-uF9wg0nA'
  #MASTER_SECRET = 'qHlx6NhSSeOhl_hoOfV4Gw'

  LOGGER = Rails.logger
  REQUEST_TIMEOUT = 5 # default

  module ClassMethods

    def register_device(device_token, options = {})

      body = parse_register_options(options).to_json

      if ( (options[:provider] || @provider) == :android ) || ( (options[:provider] || @provider) == 'android' )
        do_request(:put, "/api/apids/#{device_token}", :body => body, :authenticate_with => APPLICATION_SECRET)
      else
        do_request(:put, "/api/device_tokens/#{device_token}", :body => body, :authenticate_with => APPLICATION_SECRET)
      end
    end

    def unregister_device(device_token, options = {})
      if ( (options[:provider] || @provider) == :android ) || ( (options[:provider] || @provider) == 'android' )
        do_request(:delete, "/api/apids/#{device_token}", :authenticate_with => APPLICATION_SECRET)
      else
        do_request(:delete, "/api/device_tokens/#{device_token}", :authenticate_with => APPLICATION_SECRET)
      end
    end

    def delete_scheduled_push(param)
      path = param.is_a?(Hash) ? "/api/push/scheduled/alias/#{param[:alias].to_s}" : "/api/push/scheduled/#{param.to_s}"
      do_request(:delete, path, :authenticate_with => MASTER_SECRET)
    end

    def push(options = {})
      body = parse_push_options(options).to_json
      do_request(:post, "/api/push/", :body => body, :authenticate_with => MASTER_SECRET)
    end


    def push_to_segment(options = {})
      body = parse_push_options(options).to_json
      do_request(:post, "/api/push/segments", :body => body, :authenticate_with => MASTER_SECRET)
    end

    def batch_push(notifications = [])
      body = notifications.map{|notification| parse_push_options(notification)}.to_json
      do_request(:post, "/api/push/batch/", :body => body, :authenticate_with => MASTER_SECRET)
    end

    def broadcast_push(options = {})
      body = parse_push_options(options).to_json
      do_request(:post, "/api/push/broadcast/", :body => body, :authenticate_with => MASTER_SECRET)
    end

    def feedback(time)
      do_request(:get, "/api/device_tokens/feedback/?since=#{format_time(time)}", :authenticate_with => MASTER_SECRET)
    end

    def tags
      do_request(:get, "/api/tags/", :authenticate_with => MASTER_SECRET)
    end

    def add_tag(tag)
      do_request(:put, "/api/tags/#{tag}", :authenticate_with => MASTER_SECRET, :content_type => 'text/plain')
    end

    def remove_tag(tag)
      do_request(:delete, "/api/tags/#{tag}", :authenticate_with => MASTER_SECRET)
    end

    def tags_for_device(device_token)
      do_request(:get, "/api/device_tokens/#{device_token}/tags/", :authenticate_with => MASTER_SECRET)
    end

    def tag_device(params)
      provider_field = ( (params[:provider] || @provider) == :android ) || ( (params[:provider] || @provider) == 'android' ) ? :apids : :device_tokens
      do_request(:post, "/api/tags/#{params[:tag]}", :body => {provider_field => {:add => [params[:device_token]]}}.to_json, :authenticate_with => MASTER_SECRET)
    end

    def untag_device(params)
      provider_field = ( (params[:provider] || @provider) == :android ) || ( (params[:provider] || @provider) == 'android' ) ? :apids : :device_tokens
      do_request(:post, "/api/tags/#{params[:tag]}", :body => {provider_field => {:remove => [params[:device_token]]}}.to_json, :authenticate_with => MASTER_SECRET)
    end

    def device_tokens_count
      do_request(:get, "/api/device_tokens/count/", :authenticate_with => MASTER_SECRET)
    end

    def segments
      do_request(:get, "/api/segments", :authenticate_with => MASTER_SECRET)
    end

    def create_segment(segment)
      do_request(:post, "/api/segments", :body => segment.to_json, :authenticate_with => MASTER_SECRET)
    end

    def segment(id)
      do_request(:get, "/api/segments/#{id}", :authenticate_with => MASTER_SECRET)
    end

    def update_segment(id, segment)
      do_request(:put, "/api/segments/#{id}", :body => segment.to_json, :authenticate_with => MASTER_SECRET)
    end

    def delete_segment(id)
      do_request(:delete, "/api/segments/#{id}", :authenticate_with => MASTER_SECRET)
    end

    private

    def do_request(http_method, path, options = {})

      klass = Net::HTTP.const_get(http_method.to_s.capitalize)

      request = klass.new(path)
      request.basic_auth APPLICATION_KEY, options[:authenticate_with]

      request.add_field "Content-Type", options[:content_type] || "application/json"
      request.body = options[:body] if options[:body]
      request["Accept"] = "application/vnd.urbanairship+json; version=3"

      Timer.timeout(request_timeout) do
        start_time = Time.now
        response = http_client.request(request)
        log_request_and_response(request, response, Time.now - start_time)
        Urbanairship::Response.wrap(response)
      end
    rescue Timeout::Error
      unless LOGGER.nil?
        LOGGER.error "Urbanairship request timed out after #{request_timeout} seconds: [#{http_method} #{request.path} #{request.body}]"
      end
      Urbanairship::Response.wrap(nil, :body => {:error => 'Request timeout'}, :code => '503')
    end

    def http_client
      Net::HTTP.new("go.urbanairship.com", 443).tap{|http| http.use_ssl = true}
    end

    def parse_register_options(hash = {})
      hash[:alias] = hash[:alias].to_s unless hash[:alias].nil?
      hash
    end

    def parse_push_options(hash = {})
      hash[:aliases] = hash[:aliases].map{|a| a.to_s} unless hash[:aliases].nil?
      hash[:schedule_for] = hash[:schedule_for].map{|elem| process_scheduled_elem(elem)} unless hash[:schedule_for].nil?
      hash
    end

    def log_request_and_response(request, response, time)
      return if LOGGER.nil?

      time = (time * 1000).to_i
      http_method = request.class.to_s.split('::')[-1]
      LOGGER.info "Urbanairship (#{time}ms): [#{http_method} #{request.path}, #{request.body}], [#{response.code}, #{response.body}]"
      LOGGER.flush if LOGGER.respond_to?(:flush)
    end

    def format_time(time)
      time = Time.parse(time) if time.is_a?(String)
      time.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    end

    def process_scheduled_elem(elem)
      if elem.class == Hash
        elem.merge!(:scheduled_time => format_time(elem[:scheduled_time]))
      else
        format_time(elem)
      end
    end

    def request_timeout
      REQUEST_TIMEOUT || 5.0
    end
  end

  class << self
    include ClassMethods
  end

  class Client
    include ClassMethods
  end

  # Response

  module Response
    module InstanceMethods
      attr_accessor :ua_response, :ua_options

      def code
        (ua_options[:code] || ua_response.code).to_s
      end

      def success?
        !!(code =~ /^2/)
      end
    end

    def self.wrap(response, options = {})
      if options[:body]
        output = options[:body]
      else
        begin
          output = JSON.parse(response.body || '{}')
        rescue JSON::ParserError
          output = {}
        end
      end

      output.extend(Urbanairship::Response::InstanceMethods)
      output.ua_response = response
      output.ua_options = options

      return output
    end
  end
end





