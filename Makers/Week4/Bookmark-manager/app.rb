require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader 
  end


  get '/' do
    'Bookmark Manager'
    
  end

  get '/bookmarks' do 
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'

  end

  post '/add' do
    url = params[:url]
    title = params[:title]
    Bookmarks.add_bookmark(url: url, title: title)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end