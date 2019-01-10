class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all

    erb :'songs/songs_list'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
 
    erb :'songs/show'
  end

  post '/songs' do
    @artist = Artist.create(name: params["song"]["artist"])
    @genre = Genre.find(params["genres"].first.to_i) 
    @song = Song.create(name: params["song"]["name"], artist: @artist)
    @song.genres << @genre
    
    "hello"

    redirect "/songs/#{@song.slug}"
  end

  get '/artists' do
    @artists = Artist.all

    erb :'artists/artists_list'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
 
    erb :'artists/show'
  end


  get '/genres' do
    @genres = Genre.all

    erb :'genres/genres_list'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
 
    erb :'genres/show'
  end



end