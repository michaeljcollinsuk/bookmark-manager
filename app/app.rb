ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  # set :environment, :development

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb (:links)
  end

  get '/links/new' do
    erb (:new_link)
  end

  post '/links' do
    link = Link.new(:title => params[:title], :url => params[:url])
    tags = (params[:tags]).split(" ")
    tags.each do |tag|
      link.tags << Tag.first_or_create(:name => tag)
    end
    link.save
    redirect '/links'
  end

  get '/links/:tags' do
    tag = Tag.first(:name => params[:tags])
    @links = tag ? tag.links : []
    erb (:links)
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(:email => params[:email], :password => params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
