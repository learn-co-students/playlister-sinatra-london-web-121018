class ArtistsController < ApplicationController

     get "/artists" do
        @artists = Artist.all

        erb :"artist/index"
     end

     get "/artist/:slug" do
      @artist = Artist.find_by_slug(params[:slug])
      #binding.pry
      erb :"artist/show"
     
  end
end
