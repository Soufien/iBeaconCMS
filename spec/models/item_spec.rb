require 'spec_helper'

describe Item do
  before(:each) do
    @attr = FactoryGirl.attributes_for(:item)
  end

  it 'should create a new instance given a valid attribute' do
    Item.create!(@attr)
  end

  it 'should require a SPEC field' do
    no_valid_item = Item.new(@attr.merge(:spec => ''))
    expect(no_valid_item).not_to be_valid
  end

  it 'should require a name field' do
    no_valid_item = Item.new(@attr.merge(:name => ''))
    expect(no_valid_item).not_to be_valid
  end

end
