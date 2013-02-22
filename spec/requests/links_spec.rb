require 'spec_helper'

describe "Links" do
  describe "GET links#index" do
    it "should contain 'Listing links' but shouldn't contain any actual links" do
      visit links_path
      page.should have_content("Listing links")
      page.should_not have_content("Show")
    end

    it "should contain www.google.com when that link is created" do
      google_url = "http://www.google.com"
      
      link = FactoryGirl.create(:link, url_path:google_url)
      visit links_path
      
      page.should have_content(google_url)
    end
    
    it "should contain 3 unique links when 3 unique links are created" do
      links = []
      for num in 1..3 do
        links << "http://www.google#{num}.com"
        FactoryGirl.create(:link, url_path:links[num-1])
      end
      visit links_path

      for link in links do
        page.should have_content(link)
      end
    end

    it "should have a working 'New Link'" do
      visit links_path
      click_link "New Link"
      
      current_url.should eq("http://www.example.com/links/new")
    end
  end

#
#
#
#
#

  describe "GET links#show" do
    it "should show the page completely fine" do
      link = FactoryGirl.create(:link)
      
      get link_path(link)
      response.status.should be(200)
    end

    it "should have a working 'Edit' link that goes to that page" do
      link = FactoryGirl.create(:link)

      visit link_path(link)
      click_link "Edit"

      current_url.should eq("http://www.example.com/links/1/edit")
    end

    it "should have a working 'Back' link that goes to links@index" do
      link = FactoryGirl.create(:link)

      visit link_path(link)
      click_link "Back"

      current_url.should eq("http://www.example.com/links")
    end
  end

#
#
#
#
#

=begin
  describe "More Comprehensive Tests" do
    #Time test takes: 4 seconds
    it "should contain 20 unique links when 20 unique links are created" do
      links = []
      for num in 1..20 do
        links << "http://www.google#{num}.com"
        FactoryGirl.create(:link, url_path:links[num-1])
      end
      visit links_path

      for link in links do
        page.should have_content(link)
      end
    end

    #Time takes to run: 1 minute and 25 seconds
    it "should contain 100 unique links when 100 unique links are created" do
      links = []
      for num in 1..100 do
        links << "http://www.google#{num}.com"
        FactoryGirl.create(:link, url_path:links[num-1])
      end
      visit links_path

      for link in links do
        page.should have_content(link)
      end
    end
  end
=end
end
