class ListsController < ApplicationController
  use Rack::Flash


  get '/lists' do
    redirect '/' unless logged_in?
    @user = User.find(current_user.id)
    @lists = List.all
    erb :'/lists/lists'
  end

  get '/lists/new' do
    redirect '/' unless logged_in?
    erb :'lists/create_list'
  end

  post '/lists' do

  end



  get '/lists/:id' do

  end

  get '/lists/:id/edit' do

  end

  patch '/lists/:id' do

  end

  get '/lists/:id/delete' do

  end

  delete '/lists/:id/delete' do

  end
end
