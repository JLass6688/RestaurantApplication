module Sinatra
	module SessionHelper
		#===============================================
		# 				CURRENT USER
		#===============================================
		def current_user
			if session[:current_user]
				User.find(session[:current_user])
			else
				nil
			end
		end

		#===============================================
		# 				AUTHENTICATION
		#===============================================
		def authentication!
			redirect '/' unless current_user
		end
	end
end