require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect '/home'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect '/home'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login successful"
      redirect '/home'
    else
      redirect '/'
    end
  end

  get '/home' do
    erb :'users/home'
  end

  get '/logout' do
    if logged_in?
      session.clear
      flash[:notice] = 'Logout success'
      redirect '/'
    else
      redirect '/'
    end
  end
end
