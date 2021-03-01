class API

    def self.get_albums
        url = 'https://itunes.apple.com/search?term=beyonce&entity=album'
        resp = HTTParty.get(url)
        response = JSON.parse(resp.body)
        response["results"].each do |obj|
            Album.new(
                obj["artistName"],
                obj['collectionName'],
                obj['collectionPrice'],
                obj['releaseDate'],
                obj['trackCount'],
                obj['primaryGenreName'],
                obj['collectionViewUrl']
            )
        end
        
       
    end
end

