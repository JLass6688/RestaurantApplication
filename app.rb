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
require './models/party'
require './models/food'
require './models/order'
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
# 				USER ROUTES
#===============================================
get '/users' do
	content_type :json
	User.all.to_json

end

get '/users/:id' do

	content_type :json
	user = User.find(params[:id])
	user.parties.to_json

end

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
	user = User.find(params[:id].to_i)
	user.destroy

	{message: 'Successful'}.to_json

end



#===============================================
# 				SESSION ROUTES
#===============================================
post '/sessions' do

	user = User.find_by(username: params[:username])
	if user.password = params[:password]
		session[:current_user] = user.id
		content_type :json
		{message: 'Log-In successful'}.to_json
		redirect '/'
	else 
		redirect '/'
	end

end

delete '/sessions' do

	session[:current_user] = nil
	redirect '/'
	
end





#===============================================
# 				API ROUTES
#===============================================

#----------Parties
get '/api/parties' do

	content_type :json
	Party.all.to_json

end

get '/api/parties/:id' do

	content_type :json
	party = Party.find(params[:id])
	party.orders.to_json

end

post '/api/parties' do

	content_type :json
	party = Party.create(params[:party])
	party.to_json

end

put '/api/parties/:id' do 

	content_type :json
	party = Party.find(params[:id])
	party.update(params[:party])
	party.to_json

end

patch '/api/parties/:id' do 

	content_type :json
	party = Party.find(params[:id])
	party.update(params[:party])
	party.to_json

end

delete '/api/parties/:id' do

	content_type :json
	party = Party.find(params[:id])
	party.destroy

	{message: 'Success'}.to_json

end


#----------Orders
get '/api/orders' do

	content_type :json
	Order.all.to_json

end

get '/api/orders/:id' do

	content_type :json
	order = Order.find(params[:id])
	order.to_json

end

post '/api/orders' do

	content_type :json
	order = Order.create(params[:order])
	order.to_json

end

put '/api/orders/:id' do 

	content_type :json
	order = Order.find(params[:id])
	order.foods.update(price: params[:price])
	order.to_json

end

patch '/api/orders/:id/:food_id' do 

	content_type :json
	order = Order.find(params[:id])
	order.foods.update(price: params[:price])
	order.to_json

end

delete '/api/orders/:id' do

	content_type :json
	order = Order.find(params[:id])
	order.destroy

	{message: 'Success'}

end



#----------Foods
get '/api/foods' do

	content_type :json
	Food.all.to_json

end

get '/api/foods/:id' do

	content_type :json
	food = Food.find(params[:id].to_i)
	order = Party.all.

	order.to_json



	# parties = Party.where("id = ?", orders.id)
end

post '/api/foods' do

	content_type :json
	food = Food.create(params[:food])
	food.to_json

end

put '/api/foods/:id' do 

	content_type :json
	food = Food.find(params[:id])
	food.update(params[:food])
	food.to_json

end

patch '/api/foods/:id' do 

	content_type :json
	food = Food.find(params[:id])
	food.update(params[:food])
	food.to_json

end

delete '/api/foods/:id' do

	content_type :json
	food = Food.find(params[:id])
	food.destroy

	{message: 'Success'}.to_json

end

get '/api/parties/:id/receipt' do



end



