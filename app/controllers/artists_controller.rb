class ArtistsController < ApplicationController

     get "/artists" do
        @artists = Artist.all

        erb :"artist/index"
     end

     get "/artist/:slug" do
        erb :"/artist/#{params[:id]}"
     end
end
