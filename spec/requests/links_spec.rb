require 'spec_helper'

describe "Links" do
  describe "GET /links" do
    it "should contain 'Listing links'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get links_path
      #response.status.should be(200)
      response.body.should include("Listing links")
    end

    it "should contain www.google.com when that link is created" do
      google_url = "http://www.google.com"
      Link.create!(:url_path => google_url)
      get links_path
      response.body.should include(google_url)
    end
  end
end
