class ListsController < ApplicationController
  use Rack::Flash


  get '/lists' do

  end


  get '/lists/new' do
    if logged_in?
      erb :'lists/create_list'
    else
      redirect '/'
    end
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
