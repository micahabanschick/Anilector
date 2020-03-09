class Interface

    attr_accessor :user, :scraper 

    @@all = []

    def initialize(user=User.new, scraper=Scraper.new) 
        @user = user 
        @scraper = scraper
        self.save
    end 

    def self.all 
        @@all 
    end 

    def save 
        @@all << self 
    end 

    def welcome
        puts "Welcome #{self.user.name}, and good luck!"
    end 

    def user_name
        puts "Pleaser enter you name here"
        input_name = gets.strip
        self.user.name = input_name 
    end 

    def start
        self.user_name 
        self.welcome 
    end 

    def binary
        input = gets.strip 
        if input.match(/yes/i)
            self.run 
        elsif !input.match(/yes/i) && !input.match(/no/i) 
            puts "Please enter Yes or No."
            self.binary
        end
    end 

    def run
        binding.pry
        self.start 
        puts "Do stuff!!!!!!!!!!!!!!!!!!!!!!"
        ##########################################################
        puts "Please enter your three favorite genres."
        self.user_genres 
        anime_url = "https://myanimelist.net/anime.php"
        self.scraper.anime_from_each_genre(anime_url, self.user.genres)[0][:anime][0]
        #
        #
        ######################################################
        puts "Would you like to try again with new entries?"
        self.binary 
    end 

    def user_genres
        input = gets.strip
        if !input.match(/,/)
            puts "Invalid entry!"
            puts "Please separate each genre with a comma."
            self.user_genres 
        elsif input.split(",").length != 3
            puts "Invalid number of genres!"
            puts "Please enter no more or less than 3 genres."
            self.user_genres  
        else 
            self.user.genres = input.split(",").map{|genre| genre.strip}
        end 
    end 

end 