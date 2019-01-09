class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.gsub!(/[^0-9A-Za-z]/, ' ')

    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    slugish = slug.gsub("-", " ").split
    name = slugish.map {|n| n.capitalize}.join(" ")
    Song.find_by(name: name)
  end


end
