class FitbitSessionsController < ApplicationController
	def create
		#raise env["omniauth.auth"].to_yaml
		auth_info = env["omniauth.auth"]
		token = auth_info[:credentials][:token]
		secret = auth_info[:credentials][:secret]
		consumer_key = auth_info[:extra][:access_token].consumer.key
		consumer_secret = auth_info[:extra][:access_token].consumer.secret
		
		pass_to_reconnect = {}
		pass_to_reconnect[:consumer_key] = consumer_key
		pass_to_reconnect[:consumer_secret] = consumer_secret
		pass_to_reconnect[:token] = token
		pass_to_reconnect[:secret] = secret

		client = Fitgem::Client.new(pass_to_reconnect)

		begin
			access_token = client.reconnect(token, secret)
		rescue Exception => e
			puts "Error: Could not reconnect Fitgem::Client due to invalid keys in .fitgem.yml"
			exit
		end

		other_user_info = auth_info[:extra][:access_token].params

		#require 'debugger'
		#debugger
		#a = 10
	end
end