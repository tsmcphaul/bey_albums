require 'pry'
class Album

attr_accessor :artistName, :collectionName, :collectionPrice, :releaseDate, :trackCount, :primaryGenreName, :collectionViewUrl  
@@all = []

def initialize(name, album, cost, date, num_tracks, category, link)
    @artistName = name
    @collectionName = album
    @collectionPrice = cost
    @releaseDate = date 
    @trackCount = num_tracks
    @primaryGenreName = category
    @collectionViewUrl = link
    @@all << self
  
end

def self.all
    @@all

end

def self.album_list
    self.all.each.with_index(1) do |album, index|
        puts "#{index}. #{album.collectionName}"
    end
end



def self.find_by_number(input)
    index = input - 1
    self.all.at(index)
end


end
