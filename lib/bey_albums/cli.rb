class CLI

    def call
      API.get_albums  
      welcome
      enter_app
      purchase 
    end

    def welcome
        puts " "
        puts "Crazy in Love with Queen Bey? Let's buy some music!"
        puts " "
        puts "Please enter yes or no and press 'Enter' to continue."
    end
     
    def enter_app
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            puts " "
            puts "Great answer! Here are Beyonce's albums available for purchase:"
            puts "-----------------------------------------"
            album_list
            
        elsif input == "no" || input == "n"
            puts " "
            puts "Aww, maybe next time!"
            exit
        else
            puts " "
            puts "Whoops! Something went wrong."
            call
        end
    end

    def album_list
        puts "-----------------------------------------"
        Album.album_list
        puts "-----------------------------------------"
        options
    end

    def options
        puts " "
        puts " "
        puts "Which album are you interested in buying? Enter the number that corresponds with your choice and press 'Enter' to continue.:"
        input = gets.strip.to_i
            if input < 1 || input > 50
                puts "That's not on the list!"
                options
            end
        @selection = Album.find_by_number(input)
        puts " "
        puts " "
        puts "-----------------------------------------"
        puts "-----------------------------------------"
        puts "Artist: #{@selection.artistName}"
        puts "Album Name: #{@selection.collectionName}"
        puts "Release Date: #{@selection.releaseDate}"
        puts "Track Count: #{@selection.trackCount}"
        puts "Genre: #{@selection.primaryGenreName}"
        puts "Price: $#{@selection.collectionPrice} USD"
        puts "-----------------------------------------"
        puts "-----------------------------------------"
        puts " "
        puts "Would you like to buy this album? Enter yes or no and press 'Enter' to continue."
    

    def purchase
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            puts " "
            puts "Here is the iTunes link to purchase! Aren't you excited?"
            puts " "
            puts "iTunes link - #{@selection.collectionViewUrl}"
            puts " "
            puts "Copy and paste the link into your browser.  From there, you can proceed with purchasing your selection."
            puts "---------------------------------------------------------------------------------------------------------------"
            continue
        elsif input == "no" || input == "n"
            puts " "
            puts "That's OK!" 
            puts "-------------------------------------------------"
            continue
        else
            puts " "
            puts "Whoops! Something went wrong."
            purchase
        end
    end

    def continue
        puts " "
        puts "Would you like to view another album for purchase? Enter yes or no and press 'Enter' to continue."
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            album_list
            purchase
        elsif input == "no" || input == "n"
            puts " "
            puts "Thanks for checking this out! Come back and buy something! :)"
            exit
        else
            puts " "
            puts "Whoops! Something went wrong."
            continue
        end
    end

end
end
