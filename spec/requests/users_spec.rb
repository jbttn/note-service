require 'spec_helper'
include Warden::Test::Helpers

describe "Users" do
  before(:each) do
    @user = Factory.create(:user, username: 'foobar', email: 'foo@bar.com', password: 'password')
    login_as @user, :scope => :user
  end
  after(:all) do
    Warden.test_reset!
  end
  
  it "shows profile" do
    visit user_path(@user)
    page.should have_content(@user.username)
  end
  
  it "edits current user" do
    visit user_path(@user)
    page.should have_content('Edit')
    click_on 'Edit'
    fill_in 'user[email]', with: 'new@email.com'
    fill_in 'user[current_password]', with: 'password'
    click_on 'Update'
    @user.reload.email.should eq('new@email.com')
  end
  
  it "does not edit other users" do
    user = Factory.create(:user)
    visit user_path(user)
    page.should_not have_content('Edit')
  end
end
