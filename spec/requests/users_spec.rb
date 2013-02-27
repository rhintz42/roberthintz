require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path
      response.status.should be(200)
    end
  end
  
  describe "Get /users/reset" do
    it "should be able to get to the reset password page from login screen" do
      visit login_path
      click_link "password"
      page.should have_content("Email")
      page.should have_content("Reset Password")
    end

    it "should be able to goto the post action from reset page" do
      FactoryGirl.create :user, { username: "rhintz42" }
      visit users_reset_path
      fill_in "username", :with => "rhintz42"
      click_button "Reset Password"
    end

    it "should be able to find a url by username" do
      FactoryGirl.create :user, { username: "rhintz42" }
      visit users_reset_path
      fill_in "username", :with => "rhintz42"
      click_button "Reset Password"
    end
    
    it "should be able to find a url by email" do
      FactoryGirl.create :user, { email: "penisbutt@stanford.edu" }
      visit users_reset_path
      fill_in "email", :with => "penisbutt@stanford.edu"
      click_button "Reset Password"
    end

    it "should give an error if nothing entered" do
      FactoryGirl.create :user
      visit users_reset_path
      click_button "Reset Password"
      page.should have_content("Username or Email not found")
    end

    #it "should be fine to goto password_resets#edit" do
    #  visit edit_password_reset_path(1)
    #end
  end

  describe "Get /users/reset" do
    it "should create reset page" do
      visit users_reset_path
    end
  end

  describe "#send_password_reset" do
    let(:user) { FactoryGirl.create(:user) }

    it "generates a unique password reset_token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time the password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end
  end
end
