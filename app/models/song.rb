class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        toslug = self.name.split(" ")
        downcase = toslug.map { |word| word.downcase}
        slugged = downcase.join("-")
        slugged
    end

    def self.find_by_slug(slug)
    #    array =  slug.split("-")
    #    capitalized_array = array.map { |word| word.capitalize}
    #    song_name = capitalized_array.join(" ")
    #    binding.pry
    #    Song.find_by(name: song_name)
       Song.all.find {|song| song.slug == slug}
       
    end

end