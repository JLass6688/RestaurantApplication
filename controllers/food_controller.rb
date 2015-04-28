class FoodController < Sinatra::Base

	enable :sessions

	helpers Sinatra::SessionHelper

	get '/pry' do
	  binding.pry
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
		food = Food.create(params[:food])
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