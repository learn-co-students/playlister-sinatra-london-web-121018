class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug_name)
    self.all.find do |genre|
      # binding.pry
      genre.slug == slug_name
      genre
    end
  end

end
