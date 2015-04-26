require 'bundler'
Bundler.require()


#===============================================
# 				CONNECTION
#===============================================
ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'restaurant'
)



#===============================================
# 				MODELS
#===============================================
require './models/customer'
require './models/food'
require './models/order'
require './models/table'
require './models/user'



#===============================================
# 				SESSIONS
#===============================================
enable(:sessions)




#===============================================
# 				HELPERS
#===============================================

#-------Current User
def current_user
	if session[:current_user]
		User.find(session[:current_user])
	else
		nil
	end
end

#-------Authentication
def authentication!
	redirect '/' unless current_user
end

#-------Backbone file conversion



#===============================================
# 				INDEX ERB
#===============================================
get '/' do
	if current_user
		erb :authenticated
	else
		erb :nonauthenticated
	end
end


#===============================================
# 				SERVER ROUTES
#===============================================
post '/users' do

	content_type :json
	user = User.new(params[:user])
	user.password = params[:password]
	user.save!
	user.to_json

	redirect '/'

end

delete '/users/:id' do

	content_type :json
	user = User.find(params[:id])
	user.destroy

	{message: 'Successful'}.to_json

end



#===============================================
# 				SESSION ROUTES
#===============================================
post '/sessions' do

	user = User.find_by(name: params[:name])
	if user.password = params[:password]
		session[:current_user] = user.id
		redirect '/'
	else 
		redirect '/'
	end

end

delete '/sessions' do

	

end





#===============================================
# 				API ROUTES
#===============================================










