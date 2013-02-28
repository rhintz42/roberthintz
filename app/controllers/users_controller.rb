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
    
    file = Tempfile.new(["template_3", '.jpg'], 'public/uploads', :encoding => 'ascii-8bit')

    snap = WebSnap::Snapper.new('http://www.youtube.com', :format => 'jpg')
    jpg = snap.to_bytes
    snap.to_file(file.path)
    file.flush

    @user.profile_photo = file
    file.unlink
    #@user.profile_photo = file.path
    
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
=begin
    #THIS WORKS ON MAC BUT DOES NOT WORK ON LINUX MACHINE
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
    respond_to do |format|
      if @user.update_attributes(params[:user])
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
