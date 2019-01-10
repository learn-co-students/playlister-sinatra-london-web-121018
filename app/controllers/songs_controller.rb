class SongsController < ApplicationController

    get "/songs" do
       @songs = Song.all

       erb :"song/index"
    end

    get "/song/:slug" do
        @song = Song.find_by_slug(params[:slug])
        #binding.pry
        erb :"song/show"
       
    end
end	