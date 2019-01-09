class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.gsub!(/[^0-9A-Za-z]/,' ')
    name.downcase.gsub(" ","-")  
  end
  
end
