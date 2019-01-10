class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    new_string = self.name.gsub!(/[^a-zA-Z0-9\s]/,'')
    if new_string == nil
      new_string = self.name
    end
    even_newer_string = new_string.gsub(/[\s+]/, '-')

    newest_string_of_all = even_newer_string.gsub!('--', '-')
    # @slug_variable =
    if newest_string_of_all == nil
      newest_string_of_all = even_newer_string
    end
    newest_string_of_all.downcase
  end


  def self.find_by_slug(slug)
    Genre.all.find {|genre| genre.slug == slug}
  end

end
