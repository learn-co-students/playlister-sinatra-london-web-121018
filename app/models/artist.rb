class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name = self.name.gsub!(/[^0-9A-Za-z]/, ' ')

    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    slugish = slug.gsub("-", " ").split
    name = slugish.map {|n| n.capitalize}.join(" ")
    Artist.find_by(name: name)
  end
end