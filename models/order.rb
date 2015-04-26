class Order < ActiveRecord::Base

	belongs_to(:menuitem)
	belongs_to(:customer)

	def to_s
		self.name
	end

end