class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :songs
  end

  get '/songs/new' do
    erb :song_form
  end

  get '/genres' do
    erb :genres
  end

  get '/artists' do
    erb :artists
  end

  get '/songs/:slug' do
    erb :song_show
  end

  get ''

end
