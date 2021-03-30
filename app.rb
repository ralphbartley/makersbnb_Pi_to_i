require 'sinatra/base'

class Makersbnb < Sinatra::Base

  get '/' do
      "Testing Infrastructure"
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    redirect '/welcome'
  end

  get '/welcome' do
    erb(:welcome)
  end

end
