class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  #index
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  #new
  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  #show
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  #create
  post '/songs' do
    # binding.pry
    artist = Artist.find_or_create_by(params[:artist])
    song = Song.create(params[:song])
    song.update(artist: artist, genre_ids: params[:genres])

    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  #edit
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end

  #update
  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(params[:artist])
    song.update(params[:song])
    # binding.pry
    song.update(artist: artist, genre_ids: params[:genres])

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end



end
