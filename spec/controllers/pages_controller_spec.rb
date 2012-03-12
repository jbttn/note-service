require 'spec_helper'

describe PagesController do
  describe "GET about" do
    it "should be successful" do
      visit about_path
      response.should be_success
    end
  end
end
