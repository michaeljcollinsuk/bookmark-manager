require 'sinatra/base'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'
  # set :environment, :development

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb (:links)
  end

  get '/links/new' do
    erb (:new_link)
  end

  post '/links' do
    Link.create(:title => params[:title], :url => params[:url])
    Tag.create(:tag => params[:tag])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
