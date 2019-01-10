class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        toslug = self.name.split(" ")
        downcase = toslug.map { |word| word.downcase}
        slugged = downcase.join("-")
        slugged
    end

    def self.find_by_slug(slug)
        Artist.all.find {|artist| artist.slug == slug}
    end
end