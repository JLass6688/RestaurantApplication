class Party < ActiveRecord::Base

	belongs_to(:user)
	has_many(:orders)
	has_many(:foods, through: :orders)


	def to_s
		self.name
	end

end