class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    #require 'debugger'
    #debugger
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        #Want to send email in this case
        UserMailer.signup_confirmation(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    #debugger
    #@user[:profile_photo] = 'http://www.google.com'

    require 'imgkit'
    file = Tempfile.new(["template_3", '.png'], 'tmp', :encoding => 'ascii-8bit')
    file.write(IMGKit.new('http://www.facebook.com', quality: 100, height: 1000).to_jpg)
    #debugger
    file.flush
    #debugger
    #image = image.resize_to_fit!(72.0, 72.0)
    #require 'mini_magick'
    #debugger
    #image = MiniMagick::Image.open(IMGKit.new('http://www.roberthintz.com', quality: 100, height: 300, width: 50).to_jpg)
    #debugger
    image = MiniMagick::Image.open(file.path)
    image.resize "100x100"
    image.write file.path
    @user.profile_photo = file
    file.unlink
    @user.save
    #file = File.new("kat.jpg", 'wb')

=begin
#  THIS IS A WORKING IMPLEMENTATION OF IMGKit
    
    require 'imgkit'
    kit = IMGKit.new("http://www.google.com")
    file = File.new("public/uploads/user/profile_photo/3/kat.jpg", 'wb')

    img = kit.to_img(:jpg)
    file.write(img)
    file.close

    image = MiniMagick::Image.open(file.path)
    image.resize "300x300"
    image.write file.path
=end
    #file = Tempfile.new(["template_3", 'jpg'], 'tmp', :encoding => 'ascii-8bit')
    #file.write(IMGKit.new("http://www.google.com", quality: 50, width: 600).to_jpg)
    #file.flush
    #@user[:profile_photo] = file.path

    #@user[:profile_photo] = f.path

    respond_to do |format|
      #if @user.update_attributes(params[:user])
      if true
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  # GET /users/reset
  # GET /users/reset.json
  def reset
    
  end

  # POST /users/reset_password
  # POST /users/reset_password.json
  def reset_password
    @user = User.find_by_username(params[:username]) if params[:username].length > 0
    
    if not @user then
      @user = User.find_by_email(params[:email]) if params[:email].length > 0
    end
    
    if not @user then
      return redirect_to users_reset_url, notice: "Username or Email not found"
    end

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
