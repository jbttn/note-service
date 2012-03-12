require 'spec_helper'

describe User do
  let(:user) { Factory.build(:user) }
  
  it "must have a username" do
    user.username = nil
    user.should_not be_valid
  end

  it "should know about notes" do
    user.should respond_to(:notes)
  end
end
