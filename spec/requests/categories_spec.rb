require 'spec_helper'

def test_cats

  describe "categories#index printing correctly" do
    it "should print out the current objects in database" do
      default_folder = FactoryGirl.create :category
  
      visit categories_path
        
      page.body.scan(default_folder[:description]).length.should be(1)
    end
  end
end

describe "Categories: should receive status 200/302 for each view in categories" do
#
#
#
#
#


  describe "GET categories#index" do
    it "should receive status 200" do
      get categories_path
      response.status.should be(200)
    end

    #This is just here for a proof of concept
    test_cats

    describe "categories#index should have the proper links" do
      it "should have a 'Show' link that leads to category#show" do
        
        default_folder = FactoryGirl.create :category
  
        visit categories_path
        click_link "Show"
        current_url.should eq("http://www.example.com/categories/1")
      end
    
      it "should have an 'Edit' link that leads to category#edit" do
        
        default_folder = FactoryGirl.create :category
  
        visit categories_path
        click_link "Edit"
        current_url.should eq("http://www.example.com/categories/1/edit")
      end
    end
  end
  
  describe "GET categories#new" do
    it "should receive status 200" do
      get new_category_path
      response.status.should be(200)
    end
  end

  describe "GET categories#edit" do
    it "should receive status 200" do

      default_folder = FactoryGirl.create :category
      get edit_category_path(default_folder)
      response.status.should be(200)
    end
  end

  describe "GET categories#show" do
    it "should receive status 200" do

      default_folder = FactoryGirl.create :category
      get category_path(default_folder)
      response.status.should be(200)
    end
  end

  describe "Post categories#create" do
    it "should receive status 302" do
      
      post '/categories', {url_path: "www.google.com"}
      response.status.should be(302)
    end
  end

  describe "Put categories#update" do
    it "should receive status 302" do
      
      default_folder = FactoryGirl.create :category
      put '/categories/1', {url_path: "www.google.com"}
      response.status.should be(302)
    end
  end

  describe "DELETE categories#delete" do
    it "should receive status 302" do
      
      default_folder = FactoryGirl.create :category
      delete "/categories/1"
      response.status.should be(302)
    end
  end
end
