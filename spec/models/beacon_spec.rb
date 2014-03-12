require 'spec_helper'

describe Beacon do
  before(:each) do
    @attr = FactoryGirl.attributes_for(:beacon)
  end

  it 'should create a new instance given a valid attribute' do
    Beacon.create!(@attr)
  end

  it 'should require a UUID field' do
    no_valid_beacon = Beacon.new(@attr.merge(:uuid => ''))
    expect(no_valid_beacon).not_to be_valid
  end

  it 'should require a Major field' do
    no_valid_beacon = Beacon.new(@attr.merge(:major => ''))
    expect(no_valid_beacon).not_to be_valid
  end

  it 'should require a Minor field' do
    no_valid_beacon = Beacon.new(@attr.merge(:minor => ''))
    expect(no_valid_beacon).not_to be_valid
  end

  it 'should reject duplicate [uuid, major, minor] combination' do
    Beacon.create!(@attr)
    no_valid_beacon = Beacon.new(@attr)
    expect(no_valid_beacon).not_to be_valid
  end

end
