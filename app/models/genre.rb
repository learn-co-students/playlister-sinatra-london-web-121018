class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        toslug = self.name.split(" ")
        downcase = toslug.map { |word| word.downcase}
        slugged = downcase.join("-")
        slugged
    end

    def self.find_by_slug(slug)
       Genre.all.find {|genre| genre.slug == slug}
       
    end
end