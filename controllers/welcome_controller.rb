
class WelcomeController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  enable  :sessions
  helpers Sinatra::SessionHelper

  get '/pry' do
    binding.pry
  end

  get '/' do
    if current_user
      erb :authenticated
    else
      erb :nonauthenticated
    end
  end

end