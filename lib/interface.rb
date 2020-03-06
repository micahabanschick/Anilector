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

end 