class ApplicationController < Sinatra::Base
  require 'rack-flash'
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable:sessions
  use Rack::Flash


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
    @artist = Artist.find_or_create_by(name: params["song"]["artist"])
    @genre = Genre.find(params["genres"].first.to_i)
    @song = Song.create(name: params["song"]["name"], artist: @artist)

    @song.genres << @genre


    flash[:message] = "#{@song.name},#{@song.artist.name},#{@song.genres.first.name}, Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
      erb :'/songs/edit'
    end

    patch '/songs' do

      @song = Song.find(params["song"]["id"])
      @artist = @song.artist
      @artist.name = params["song"]["artist"]



      flash[:message] = "Successfully updated song.#{@song.name},#{@song.artist.name} "
      redirect :"/songs/#{@song.slug}"
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
