require 'rack-flash'

class ListsController < ApplicationController
  use Rack::Flash

  get '/lists' do
    if logged_in?
      @user = User.find(current_user.id)
      @lists = List.all
      erb :'lists/lists'
    else
      redirect to '/'
    end
  end

  get '/lists/new' do
    if logged_in?
      erb :'lists/create_list'
    else
      redirect '/'
    end
  end

  post '/lists' do
    if params[:content].empty?
      redirect 'lists/new'
    else
      list = List.create(content: params[:content], user_id: current_user.id)
      redirect to '/lists'
    end
  end

  get '/lists/:id' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      erb :'lists/show_list'
    else
      redirect '/login'
    end
  end

  get '/lists/:id/edit' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      if @list.user.id == current_user.id
        erb :'lists/edit_list'
      end
    else
      redirect '/'
    end
  end

  patch '/lists/:id' do
    if params[:content].empty?
      redirect "/lists/#{params[:id]}/edit"
    else
      @list = List.find_by_id(params[:id])
      @list.content = params[:content]
      @list.save
      redirect to "/lists/#{@list.id}"
    end
  end

  get '/lists/:id/delete' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      if @list.user.id == current_user.id
        erb :'lists/edit_list'
      end
    else
      redirect '/'
    end
  end

  delete '/lists/:id/delete' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      if @list.user.id == current_user.id
        @list.delete
        redirect to '/lists'
      end
    else
      redirect '/'
    end
  end
end
