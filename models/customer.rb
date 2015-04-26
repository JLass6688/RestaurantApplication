class Customer < ActiveRecord::Base

	belongs_to(:table)
	has_many(:orders)
	has_many(:food_items, through: :orders)


	def to_s
		self.name
	end

end