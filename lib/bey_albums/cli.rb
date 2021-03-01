class CLI


    def call
      API.get_albums  
      welcome
      enter_app
      purchase
      
    end

    def welcome
        puts " "
        puts "Crazy in Love with Queen Bey? Want to check out a list of her albums available on iTunes?"
        puts " "
        puts "Please enter yes or no"
    end
     
    def enter_app
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            puts " "
            puts "Great answer! Here are Beyonce's albums:"
            puts "-----------------------------------------"
            album_list
            
        elsif input == "no" || input == "n"
            puts "Aww, maybe next time!"
            exit
        else
            puts "Whoops! Something went wrong."
            call
        end
    end

    def album_list
        #list of albums
        Album.album_list
        options
    end

    def options
        puts " "
        puts " "
        puts "Which album are you interested in? Enter the number that corresponds with your choice:"
        input = gets.strip.to_i
            if input < 1 || input > 50
                puts "That's not on the list!"
                options
            end
        @selection = Album.find_by_number(input)
        puts " "
        puts " "
        puts "Artist: #{@selection.artistName}"
        puts "Album Name: #{@selection.collectionName}"
        puts "Release Date: #{@selection.releaseDate}"
        puts "Track Count: #{@selection.trackCount}"
        puts "Genre: #{@selection.primaryGenreName}"
        puts "Price: $#{@selection.collectionPrice} USD"
        puts " "
        puts "Are you interested in buying this album?"
        

    def purchase
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            puts " "
            puts "Here is the Itunes link to purchase!"
            puts "Itunes link - #{@selection.collectionViewUrl}"
            puts "-----------------------------------------"
            continue
        elsif input == "no" || input == "n"
            puts "That's OK!" 
            continue
        else
            puts "Whoops! Something went wrong."
            purchase
        end
    end

    def continue
        puts "Would you like to view another album? Yes or no?"
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            album_list
            purchase
        elsif input == "no" || input == "n"
            puts "Thanks for checking this out!"
            exit
        else
            puts "I didn't understand your answer"
            continue
        end
    end


end
end
