class SessionController < Sinatra::Base

	enable :sessions

	use Rack::MethodOverride 
	helpers Sinatra::SessionHelper

	get '/pry' do
	  binding.pry
	end


#===============================================
# 				SESSION ROUTES
#===============================================
	post '/' do

		user = User.find_by(username: params[:username])
		if user.password = params[:password]
			session[:current_user] = user.id
			content_type :json
			redirect '/'
		else 
			redirect '/'
		end

	end

	delete '/' do

		session[:current_user] = nil
		redirect '/'
		
	end

end