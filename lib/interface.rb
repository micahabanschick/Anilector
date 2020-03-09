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

    def choices(site)
        results = self.scraper.anime_from_each_genre(site, self.user.genres)

        includes_two = results.map{|genre| genre[:anime].filter{|anime| anime[:genres].include?(self.user.genres[0]) && anime[:genres].include?(self.user.genres[1]) || anime[:genres].include?(self.user.genres[0]) && anime[:genres].include?(self.user.genres[2]) || anime[:genres].include?(self.user.genres[1]) && anime[:genres].include?(self.user.genres[2])}}.flatten.uniq 

        includes_three = includes_two.filter{|anime| anime[:genres].include?(self.user.genres[0]) && anime[:genres].include?(self.user.genres[1]) && anime[:genres].include?(self.user.genres[2])}

        if includes_three.length > 0
            includes_three
        elsif includes_two.length > 0 
            includes_two 
        else 
            results 
        end 
    end

    def results(site)
        choices = self.choices(site)
        if choices.length == 1 
            puts "We recommend you start with this #{choices[0][:genres][0]} series called #{choices[0][:name]}."
            puts "We hope you enjoy!"
        elsif choices.length == 2 
            puts "We've narrowed your search down to these two choices: #{results.join(" and ")}."
            puts "We hope you enjoy!"
        else
            results = choices.filter{|anime| choices.index(anime) < 3}
            puts "We've narrowed your search down to these three choices: #{results.join(", ").gsub(results[2],"and #{results[2]}")}."
            puts "We hope you enjoy!"
        end 
    end 

    def run(site)
        #binding.pry
        self.start 
        puts "Do stuff!!!!!!!!!!!!!!!!!!!!!!"
        ##########################################################
        puts "Please enter your three favorite genres."
        self.user_genres 
        #anime_url = "https://myanimelist.net/anime.php"
        self.results(site)
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