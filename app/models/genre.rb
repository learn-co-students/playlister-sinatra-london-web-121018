class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name = self.name.gsub!(/[^0-9A-Za-z]/, ' ')

    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    slugish = slug.gsub("-", " ").split
    name = slugish.map {|n| n.capitalize}.join(" ")
    Genre.find_by(name: name)

  end
end
