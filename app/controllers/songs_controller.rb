class SongsController < ApplicationController

    get "/artists" do
       @songs = Song.all

       erb :"song/index"
    end

    get "/song/:slug" do
       erb :"/song/#{params[:id]}"
    end
end	