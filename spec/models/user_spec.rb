require 'spec_helper'

describe User do
  before(:each) do
    @attr = FactoryGirl.attributes_for(:user)
  end

  it 'should create a new instance given a valid attribute' do
    user = User.create!(@attr)
    expect(user).to be_valid
  end

  it 'should require a Email field' do
    no_valid_user = User.new(@attr.merge(:email => ''))
    expect(no_valid_user).not_to be_valid
  end

  it 'should require a first name field' do
    no_valid_user = User.new(@attr.merge(:first_name => ''))
    expect(no_valid_user).not_to be_valid
  end

  it 'should require a last name field' do
    no_valid_user = User.new(@attr.merge(:last_name => ''))
    expect(no_valid_user).not_to be_valid
  end

  it 'should reject duplicate emails' do
    User.create!(@attr)
    no_valid_user = User.new(@attr)
    expect(no_valid_user).not_to be_valid
  end

  it 'should reject duplicate emails' do
    User.create!(@attr)
    no_valid_user = User.new(@attr)
    expect(no_valid_user).not_to be_valid
  end

  it 'should reject wrong email format' do
    User.create!(@attr)
    no_valid_user = User.new(@attr.merge(:email => 'thisisnot@anemail'))
    expect(no_valid_user).not_to be_valid
  end


end
