require 'spec_helper'
include Warden::Test::Helpers

describe "Notes" do
  before(:each) do
    @user = Factory.create(:user, username: 'foobar', email: 'foo@bar.com')
    login_as @user, :scope => :user
  end
  after(:all) do
    Warden.test_reset!
  end
  
  it "creates a new note associated with current user" do
    lambda do
      visit new_note_path
      fill_in 'note[title]', with: 'Note Title'
      fill_in 'note[content]', with: 'Note Content'
      click_on 'Create'
    end.should change(Note, :count).by(1)
    Note.last.owner.should eq(@user)
  end
end
