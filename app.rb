require 'sinatra/base'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:home)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    # session[:username] = params[:username]
    Users.sign_up(params[:username], params[:password])
    redirect '/welcome'
  end

  get '/sign_in' do
    erb(:sign_in)
  end

  post '/sign_in' do
    session[:username] = params[:username]
    # Users.user(params[:username])
    # if Users.new.password == params[:password]
    #   redirect '/welcome'
    # else
    #   redirect './sign_in'
    # end
    redirect '/welcome'
  end

  get '/welcome' do
    # @username = session[:username]
    @username = Users.user.username
    erb(:welcome)
  end

  get '/listings' do
    @name = session[:name]
    @description = session[:description]
    @daily_price = session[:daily_price]
    erb(:listings)
  end

  get '/listings/new' do
    erb(:list_space)
  end

  post '/listings/new' do
    session[:name] = params[:name]
    session[:description] = params[:description]
    session[:daily_price] = params[:daily_price]
    redirect '/listings'
  end
end
