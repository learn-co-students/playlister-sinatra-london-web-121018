class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  attr_accessor :slug_variable

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
    Artist.all.find {|artist| artist.slug == slug}
  end

end
