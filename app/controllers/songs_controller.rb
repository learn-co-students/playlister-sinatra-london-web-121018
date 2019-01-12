class SongsController < ApplicationController

    

    get "/songs" do
       @songs = Song.all.select{|song| song.name}

       erb :"song/index"
    end
    
    get "/songs/new" do
        @genres = Genre.all
        erb :"song/new"
    end

    get "/songs/:slug" do
        #binding.pry
        @song = Song.find_by_slug(params[:slug])
        erb :"song/show"       
    end


    post "/songs" do
        if !Artist.find_by(name: params[:song][:artist_id])
            artist = Artist.create(name: params[:song][:artist_id])
            params[:song][:artist_id] = artist.id
        else
            artist = Artist.find_by(name: params[:song][:artist_id])
            params[:song][:artist_id] = artist.id            
        end
        
        song = Song.create(params[:song])
        
        params[:genres].each do |genre| 
            SongGenre.create(genre_id: genre.to_i, song_id: song.id)
        end        
    
        flash[:message] = "Successfully created song."
        flash[:message]
        #binding.pry
        redirect :"songs/#{song.slug}"

    end

    get "/songs/:slug/edit" do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        
        erb :"/song/edit"
    end

    patch "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        #binding.pry
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:song][:artist_id])
        @song.genre_ids = params[:genres]
        @song.save
        
        redirect :"songs/#{@song.slug}"
    end


end	