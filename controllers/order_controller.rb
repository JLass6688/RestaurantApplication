class OrderController < Sinatra::Base

	enable :sessions

	helpers Sinatra::SessionHelper

	get '/pry' do
	  binding.pry
	end

#===============================================
# 				ORDER ROUTES
#===============================================


	get '/' do
		content_type :json
		Order.all.to_json
	end


	get '/:id' do
		content_type :json
		order = Order.find(params[:id])
		order.to_json
	end


	post '/' do
		content_type :json
		order = Order.create(params[:order])
		order.to_json
	end


	patch '/:id' do 
		content_type :json
		order = Order.find(params[:id].to_i)
		order.no_charge = true;
		order.to_json
	end


	patch '/:id' do 
		content_type :json
		order = Order.find(params[:id].to_i)
		order.no_charge = true;
		order.to_json
	end


	delete '/:id' do
		content_type :json
		order = Order.find(params[:id])
		order.destroy

		{message: 'Success'}
	end

end