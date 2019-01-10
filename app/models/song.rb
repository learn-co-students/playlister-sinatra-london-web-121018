class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    #binding.pry
    self.name.gsub(/[^0-9A-Za-z ]/, '').downcase.gsub(" ", "-")
    #slugged_song_name ? slugged_song_name.downcase.gsub(" ", "-") : self.name
  end

  def self.find_by_slug(slug)
    Song.all.select{|song| song.name}.find{|song| song.slug == slug}
  end


end
