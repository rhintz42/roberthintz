class ServersController < ApplicationController
  def index
  	@servers = Server.all

  	respond_to do |format|
  		format.html
  		format.json { render json: @servers }
  	end
  end

  def show
  	@server = Server.find(params[:id])

  	respond_to do |format|
  		format.html
  		format.json { render json: @server }
  	end
  end

  def new
  	@server = Server.new

  	respond_to do |format|
  		format.html
  		format.json { render json: @server }
  	end
  end

  def edit
  	@server = Server.find(params[:id])
  end

  def create
  	@server = Server.new(params[:server])

  	respond_to do |format|
  		if @server.save
  			format.html { redirect_to @server, notice: 'Server entry created successfully!'}
  			format.json { render json: @server, status: :created, location: @server }
  		else
  			format.html { render action: "new" }
  			format.json { render json: @server.errors, status: :unprocessed_entity }
  		end
  	end
  end

  def update
  	@server = Server.find(params[:id])

  	respond_to do |format|
  		if @server.update_attributes(params[:server])
  			format.html { redirect_to @server, notice: 'User was successfully updated!'}
  			format.json { head :no_content }
  		else
  			format.html { render action: "edit" }
  			format.json { render json: @server.errors, status: :unprocessed_entity }
  		end
  	end
  end

  def destroy
  	@server = Server.find(params[:id])
  	@server.destroy

  	respond_to do |format|
  		format.html { redirect_to servers_url }
  		format.json { head :no_content }
  	end
  end
end
