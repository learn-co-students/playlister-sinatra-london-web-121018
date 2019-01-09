class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  def slug
    slug = name.downcase.gsub(/[^abcdefghijklmnopqrstuvwxyz ]/, '').split.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find{|song_genre|song_genre.slug == slug}
  end


end
