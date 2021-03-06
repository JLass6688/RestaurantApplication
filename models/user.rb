class User < ActiveRecord::Base

	has_many(:parties)

	include BCrypt

	def password 
		@password ||= Password.new(self.password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

end
