require 'bundler'
Bundler.require()


#===============================================
# 				CONNECTION
#===============================================
ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'restaurant'
)



#===============================================
# 				MODELS
#===============================================
require './models/party'
require './models/food'
require './models/order'
require './models/user'



#===============================================
# 				Helpers
#===============================================
require './helpers/session_helpers'