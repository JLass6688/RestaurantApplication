class OrderController < Sinatra::Base

	enable :sessions

	helpers Sinatra::SessionHelper

	get '/pry' do
	  binding.pry
	end

	  # ***** Helpers *****
  def order_params
    return params[:order] if params[:order]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['order'] || body_data
  end

#===============================================
# 				ORDER ROUTES
#===============================================


	get '/' do
		content_type :json
		foods = Order.all.to_json
	end


	get '/:id' do
		content_type :json
		order = Order.find(params[:id])
		order.to_json
	end


	post '/' do
		content_type :json
		order = Order.create(order_params)
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