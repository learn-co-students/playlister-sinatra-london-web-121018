class ArtistsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do

    erb :"songs/new"
  end

  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/songs/:slug' do
    erb :song_show
  end

  get '/'



end
