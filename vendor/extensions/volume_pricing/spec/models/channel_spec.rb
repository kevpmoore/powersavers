require File.dirname(__FILE__) + '/../spec_helper'

describe Channel do
  before(:each) do
    @channel = Channel.new
  end

  it "should be valid" do
    @channel.should be_valid
  end
end
