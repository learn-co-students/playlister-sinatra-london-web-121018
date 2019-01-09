class Genre < ActiveRecord::Base
  has_many :genre_songs
  has_many :songs, through: :genre_songs
  has_many :artists, through: :songs

  def slug
    slug = name.downcase.gsub(/[^abcdefghijklmnopqrstuvwxyz ]/, '').split.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find{|genre|genre.slug == slug}
  end


end
