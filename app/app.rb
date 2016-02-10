require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb (:links)
  end

  get '/links/new' do
    erb (:new_link)
  end

  post '/links' do
    link = Link.create(:title => params[:title], :url => params[:url])
    params[:tag].split(" ").each do |tag|
    link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
