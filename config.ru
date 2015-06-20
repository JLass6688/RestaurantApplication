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

#===============================================
# 				CONTROLLERS
#===============================================
require './controllers/food_controller'
require './controllers/order_controller'
require './controllers/party_controller'
require './controllers/user_controller'
require './controllers/welcome_controller'
require './controllers/session_controller'

#===============================================
# 				START APP
#===============================================

map('/users') { run UserController.new() }
map('/sessions') { run SessionController.new() }
map('/api/parties') { run PartyController.new() }
map('/api/orders') { run OrderController.new() }
map('/api/foods') { run FoodController.new() }
map('/') { run WelcomeController.new() }











