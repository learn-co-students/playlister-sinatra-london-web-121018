class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :genre_songs
  has_many :genres, through: :genre_songs 

  def slug
    self.name.downcase.gsub(/[^abcdefghijklmnopqrstuvwxyz ]/,'').split.join("-")
  end

  def self.find_by_slug(slug1)
    self.all.find{|song|song.slug == slug1}
  end

end
