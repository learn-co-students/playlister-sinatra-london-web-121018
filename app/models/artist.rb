class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  def slug
    name = self.name.gsub(/[^0-9A-Za-z ]/, '')
    #binding.pry
    name ? name.downcase.gsub(" ", "-") : self.name
  end

  def self.find_by_slug(slug)
    Artist.all.find{|song| song.slug == slug}
  end

end