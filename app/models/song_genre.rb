class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  def slug(string)
    new_string = string.gsub!(/[^a-zA-Z0-9\s]/,'')
    even_newer_string = new_string.gsub!(/[\s+]/, '-')
    newest_string_of_all = even_newer_string.gsub('--', '-')
    newest_string_of_all
  end


end
