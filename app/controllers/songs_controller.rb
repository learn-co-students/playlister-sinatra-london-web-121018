class SongsController < ApplicationController

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
    artist = Artist.create(params[:artist])
    song = Song.create(params[:song])
    binding.pry
    song.artist = artist
    song.genres << params[:genres]

    redirect "/songs/#{song.slug}"
  end

  #update
  patch '/songs/new' do

  end



end
