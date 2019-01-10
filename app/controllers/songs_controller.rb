class SongsController < ApplicationController


  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/" do
    redirect "/songs"
  end

  post "/songs" do
    song1 = Song.create(name:params[:song][:name])
    if !Artist.find_by(name: params[:song][:"artist.name"])
      newartist = Artist.create(name:params[:song][:"artist.name"])
      song1.artist = newartist
      song1.save
    elsif
      song1.artist = Artist.find_by(name: params[:song][:"artist.name"])
      song1.save
    end
    genrearray = []
    params[:song][:genres].each do |genreids|
      genrearray << Genre.find(genreids)
    end
    genrearray.each do |genre1|
      song1.genres << genre1
    end
    
    slug1 = song1.slug
    flash[:message] = "Successfully created song."
    redirect "/songs/#{slug1}"
  end


  get "/songs/new" do
    @genres = Genre.all
    erb :"songs/new"
  end

  get "/songs/:slug" do
    
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    erb :"songs/show" 
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    #binding.pry
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    
    song1 = Song.find_by(name:params[:song][:name])
    #binding.pry
    song1.update(name:params[:song][:name])
    if !Artist.find_by(name: params[:song][:"artist.name"])
      newartist = Artist.create(name:params[:song][:"artist.name"])
      song1.artist = newartist
      song1.save
    elsif
      song1.artist = Artist.find_by(name: params[:song][:"artist.name"])
      song1.save
    end
    genrearray = []
    params[:song][:genres].each do |genreids|
      genrearray << Genre.find(genreids)
    end
    #binding.pry
    genrearray.each do |genre1|
      if !song1.genres.include?(genre1)
       song1.genres << genre1
      end
    end
    song1.save
    slug1 = song1.slug
    
    flash[:message] = "Successfully updated song."
    binding.pry
    redirect "/songs/#{slug1}"
  end

  
end