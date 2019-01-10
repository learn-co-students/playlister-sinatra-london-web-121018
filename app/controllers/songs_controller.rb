class SongsController < ApplicationController

    

    get "/songs" do
       @songs = Song.all

       erb :"song/index"
    end
    
    get "/songs/new" do
        @genres = Genre.all
        erb :"song/new"
    end

    get "/songs/:slug" do
        binding.pry
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
        binding.pry
        redirect :"songs/#{song.slug}"

    end
end	