require 'sinatra/base'
require './lib/users.rb'
require 'pg'
require './lib/spaces.rb'
ENV['PROD_NAME'] = 'makersbnb'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:home)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    Users.sign_up(params[:username], params[:password])
    session[:username] = params[:username]
    redirect '/welcome'
  end

  get '/sign_in' do
    erb(:sign_in)
  end

  post '/sign_in' do
    session[:username] = params[:username]
     account = Users.user(params[:username])
     if account.password == params[:password]
       redirect '/welcome'
    else
      redirect './sign_in'
    end
  end

  get '/welcome' do
    # @username = session[:username]
    @username = Users.user(session[:username]).username
    erb(:welcome)
  end

  get '/listings' do
    @spaces = Spaces.all
    erb(:listings)
  end

  get '/listings/new' do
    erb(:list_space)
  end

  post '/listings/new' do
    user = Users.user(session[:username]).id
    Spaces.add(params[:name], params[:description], params[:daily_price], user)
    redirect '/listings'
  end

  get '/listings/:id' do
    @spaces = Spaces.all
    @spaces.each do |space|
      @new_space = space if space.id == params[:id]
    end
    erb(:space)
  end
end
