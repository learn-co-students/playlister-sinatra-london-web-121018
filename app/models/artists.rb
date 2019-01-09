require 'pry'
# require_relative '../../config/environment.rd'

class Artist < ActiveRecord::Base
  has_many :songs
  # has_many :song_genres, through: :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug_name)
    self.all.find do |artist|
      # binding.pry
      artist.slug == slug_name
      artist
    end
  end

end

# a1 = Artist.create(name: "Ed Sheeran")
# binding.pry
# p 'eof'
