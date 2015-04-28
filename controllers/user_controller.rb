class UserController < Sinatra::Base

	enable :sessions

	helpers Sinatra::SessionHelper

	get '/pry' do
	  binding.pry
	end

#===============================================
# 				USER ROUTES
#===============================================
	post '/' do

		content_type :json
		user = User.new(params[:user])
		user.password = params[:password]
		user.save!
		user.to_json

		redirect '/'

	end

	delete '/:id' do

		content_type :json
		user = User.find(params[:id].to_i)
		user.destroy

		{message: 'Successful'}.to_json

	end

end