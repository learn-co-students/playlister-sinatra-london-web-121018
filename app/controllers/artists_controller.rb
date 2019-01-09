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
    @song = Song.find(params[:slug].find_by_slug)
    erb :"songs/show"
  end

  get '/artists/:slug' do
    @artist = Artist.find(params[:slug].find_by_slug)
    erb :"artists/show"
  end

  get '/genres/:slug' do
    @genre = Genre.find(params[:slug].find_by_slug)
    erb :'genres/show'
  end

end
