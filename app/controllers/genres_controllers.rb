class GenresController < ApplicationController

    get "/genres" do
       @genres = Genre.all

       erb :"genre/index"
    end

    get "/genre/:slug" do
       erb :"/genre/#{params[:id]}"
    end
end