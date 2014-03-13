require 'spec_helper'

describe Detection do
  before(:each) do
    @attr = FactoryGirl.attributes_for(:detection)
  end

  it 'should create a new instance given a valid attribute' do
    detection = Detection.create!(@attr)
    expect(detection).to be_valid
  end

  it 'should require a beacon field' do
    no_valid_detection = Detection.new(@attr.merge(:beacon => ''))
    expect(no_valid_detection).not_to be_valid
  end

  it 'should require a user field' do
    no_valid_detection = Detection.new(@attr.merge(:user => ''))
    expect(no_valid_detection).not_to be_valid
  end

  it 'should require a proximity field' do
    no_valid_detection = Detection.new(@attr.merge(:proximity => ''))
    expect(no_valid_detection).not_to be_valid
  end

  it 'should require a accuracy field' do
    no_valid_detection = Detection.new(@attr.merge(:accuracy => ''))
    expect(no_valid_detection).not_to be_valid
  end

  it 'should require a rssi field' do
    no_valid_detection = Detection.new(@attr.merge(:rssi => ''))
    expect(no_valid_detection).not_to be_valid
  end
end
