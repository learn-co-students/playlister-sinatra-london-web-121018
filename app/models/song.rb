class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.gsub!(/[^0-9A-Za-z]/, ' ')
    #binding.pry
    name ? name.downcase.gsub(" ", "-") : self.name
  end

  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end


end
