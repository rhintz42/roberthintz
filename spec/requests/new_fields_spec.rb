require 'spec_helper'

def print_category folder
  puts [folder[:id], folder[:title], folder[:description], folder[:picture], folder[:parent_id]]
end

describe "NewFields" do
  describe "GET /new_fields" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      folder = FactoryGirl.create :category
      visit category_path(folder[:id])
      click_link "Create New Folder"
      page.should have_content("New category")
    end
    #THESE ARE THINGS I'VE TAKEN OUT OF THE FIRST TEST THAT MAY BE GOOD LATER
    #folder2 = FactoryGirl.create :category
    #puts folder2[:id]
    #print_category folder
    #get category_path(folder)
    #response.body.should include("Links in Current Folder:")
    #response.body.should include("New category")
    #get categories_path
    #response.status.should be(200)
      
  end
end
