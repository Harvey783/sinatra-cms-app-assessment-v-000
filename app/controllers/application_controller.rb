require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "supersecret"
  end

  get '/' do
    if logged_in?
      redirect '/home'
    else
      erb :index
  end

  helpers do

  end

end
