class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genre
end
