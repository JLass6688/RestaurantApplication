class FoodController < Sinatra::Base

	enable :sessions

	helpers Sinatra::SessionHelper

	get '/pry' do
	  binding.pry
	end

	# ***** Helpers *****
	def food_params
	return params[:food] if params[:food]
	body_data = {}
	@request_body ||= request.body.read.to_s
	body_data = (JSON(@request_body)) unless @request_body.empty?
	body_data = body_data['party'] || body_data
	end


#===============================================
# 				FOOD ROUTES
#===============================================


	get '/' do
		content_type :json
		Food.all.to_json
	end


	get '/:id' do
		content_type :json
		food = Food.find(params[:id].to_i)
		orders = food.orders

		partyList = []
		partyList.push(food['name'])

		orders.each do |order|
			id = order.party_id.to_i
			party = Party.find_by(id: id)
			partyList.push("Party: " + party.id.to_s + ", Table Number: " + party.table_num.to_s)
		end

		partyList = partyList.uniq
		partyList.to_json

	end


	post '/' do
		content_type :json
		food = Food.create(food_params)
		food.to_json
	end


	put '/:id' do 
		content_type :json
		food = Food.find(params[:id])
		food.update(params[:food])
		food.to_json
	end


	patch '/:id' do 
		content_type :json
		food = Food.find(params[:id])
		food.update(params[:food])
		food.to_json
	end


	delete '/:id' do
		content_type :json
		food = Food.find(params[:id])
		food.destroy

		{message: 'Success'}.to_json
	end

end