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
        self.start 
        "Do stuff!!!!!!!!!!!!!!!!!!!!!!"
        ##########################################################
        #
        #
        #
        ######################################################
        puts "Would you like to try again with new entries?"
        self.binary 
    end 

end 