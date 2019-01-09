class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

def slug
    name = self.name.gsub!(/[^0-9A-Za-z]/,' ')
    name.downcase.gsub(" ","-")  
  end

def self.find_by_slug(slug)
 array = []
 a = slug.gsub("-"," ")
    hash.each do |k, v|
      if hash[k] == "name" &&  /#{a}/.match(hash[v])
        array << v
      end
    end 
    binding.pry
end

end