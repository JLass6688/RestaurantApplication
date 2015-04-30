class PartyController < Sinatra::Base

	enable :sessions

	helpers Sinatra::SessionHelper

	get '/pry' do
	  binding.pry
	end


# ***** Helpers *****
	def party_params
	return params[:party] if params[:party]
	body_data = {}
	@request_body ||= request.body.read.to_s
	body_data = (JSON(@request_body)) unless @request_body.empty?
	body_data = body_data['party'] || body_data
	end

#===============================================
# 				PARTY ROUTES
#===============================================


	get '/' do
		content_type :json
		Party.all.to_json(include: :foods)
	end


	get '/:id' do
		content_type :json
		party = Party.find(params[:id])
		party.orders.to_json
	end


	post '/' do
		
		party = Party.create(party_params)
		content_type :json
		party.to_json
	end


	put '/:id' do 
		content_type :json
		party = Party.find(params[:id])
		party.update(params[:party])
		party.to_json(include: :foods)
	end


	patch '/:id' do 
		content_type :json
		party = Party.find(params[:id].to_i)
		party.update(params[:party])
		party.to_json(include: :foods)
	end


	delete '/:id' do
		content_type :json
		party = Party.find(params[:id].to_i)
		party.destroy

		{message: 'Success'}.to_json
	end


	get '/:id/receipt' do
		party = Party.find(params[:id].to_i)
		orders = party.orders
		food = orders[0].food.name
		# total = 0
		# tax = 0

		# start =  "    ---Restaurant---\n    	Tag Line\n     (555)555-5555\n\n"
		# start += "Table: #{party.table_num}  |  Guests: #{party.party_size}\n_______________________\nItem			   Cost\n"
		# orders.each do |order|
		# 	start+= "#{order.food.name}		#{order.food.price}\n"
		# 	total += order.food.price
		# end

		# tax = (total.to_f * 6 / 100).round(2)
		# tip_15 = (total.to_f * 15 / 100).to_i
		# tip_20 = (total.to_f * 20 / 100).to_i
		# tip_25 = (total.to_f * 25 / 100).to_i

		# start+= "_______________________\n			 Food: #{total}\n			 Tax: (#{tax})\n			 Tip: \n			 Total:\n(Suggested Tip)\n15% - #{tip_15}\n20% - #{tip_20}\n25% - #{tip_25}\n"
		# start += "Thank you for dining with us!\n"

		# File.write("receipt_print.txt", start)
		# File.open("receipts.txt", "a+"){|f| f << start }
		content_type :json
		food.to_json
	end


	patch '/:id/checkout' do
		content_type :json
		party = Party.find(params[:id].to_i)
		party.paid = true;
		party.to_json
	end


	put '/:id/checkout' do
		content_type :json
		party = Party.find(params[:id].to_i)
		party.paid = true;
		party.to_json
	end

end