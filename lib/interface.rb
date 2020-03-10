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
        puts ""
        self.welcome 
    end 

    def binary
        input = gets.strip 
        if input.match(/yes/i)
            puts ""
            self.run 
        elsif !input.match(/yes/i) && !input.match(/no/i) 
            puts ""
            puts "Please enter Yes or No."
            self.binary
        end
    end 

    def choices(site)
        includes_one = self.scraper.anime_from_each_genre(site, self.user.genres)

        includes_two = includes_one.map{|genre| genre[:anime].filter{|anime| anime[:genres].include?(self.user.genres[0]) && anime[:genres].include?(self.user.genres[1]) || anime[:genres].include?(self.user.genres[0]) && anime[:genres].include?(self.user.genres[2]) || anime[:genres].include?(self.user.genres[1]) && anime[:genres].include?(self.user.genres[2])}}.flatten.uniq 

        includes_three = includes_two.filter{|anime| anime[:genres].include?(self.user.genres[0]) && anime[:genres].include?(self.user.genres[1]) && anime[:genres].include?(self.user.genres[2])}

        if includes_three.length > 0
            includes_three
        elsif includes_two.length > 0 
            includes_two 
        else 
            includes_one  
        end 
    end

    def results(site)
        choices = self.choices(site)
        puts self.timer
        if choices.length == 1 
            puts ""
            puts ""
            puts "We recommend you start with this #{choices[0][:genres][0]} series called #{choices[0][:name]}."
            puts ""
            puts "Here's a synopsis:"
            puts choices[0][:synopsis]
            puts ""
            puts "We hope you enjoy!"
        elsif choices.length == 2 
            results = choices.filter{|anime| choices.index(anime) < 2}
            puts ""
            puts ""
            puts "We've narrowed your search down to two choices."
            puts "This final step is up to YOU!"
            puts "We'll provide a synopsis of each and you'll pick which description sounds the most appealing by entering \"1\" or \"2\"."
            puts ""
            puts "1:"
            puts results[0][:synopsis]
            puts ""
            puts "2:"
            puts results[1][:synopsis]
            best = gets.strip 
            case best 
            when "1"
                puts "We recommend you start with this #{results[0][:genres][0]} series called #{results[0][:name]}."
                puts "We hope you enjoy!"
            when "2"
                puts "We recommend you start with this #{results[1][:genres][0]} series called #{results[1][:name]}."
                puts "We hope you enjoy!"
            else 
                puts "Invalid entry!"
                puts "Please enter \"1\" or \"2\"."
                self.results
            end
        else
            results = choices.filter{|anime| choices.index(anime) < 3}
            puts ""
            puts ""
            puts "We've narrowed your search down to three choices."
            puts "This final step is up to YOU!"
            puts "We'll provide a synopsis of each and you'll pick which description sounds the most appealing by entering \"1\", \"2\", or \"3\"."
            puts ""
            puts "1:"
            puts results[0][:synopsis]
            puts ""
            puts "2:"
            puts results[1][:synopsis]
            puts ""
            puts "3:"
            puts results[2][:synopsis]
            best = gets.strip 
            case best 
            when "1"
                puts "We recommend you start with this #{results[0][:genres][0]} series called #{results[0][:name]}."
                puts "We hope you enjoy!"
            when "2"
                puts "We recommend you start with this #{results[1][:genres][0]} series called #{results[1][:name]}."
                puts "We hope you enjoy!"
            when "3"
                puts "We recommend you start with this #{results[2][:genres][0]} series called #{results[2][:name]}."
                puts "We hope you enjoy!"
            else 
                puts "Invalid entry!"
                puts "Please enter \"1\", \"2\", or \"3\"."
                self.results
            end
        end 
    end 

    def run(site)
        #binding.pry
        self.start 
        puts ""
        puts "Please enter your three favorite genres (if you would like to see what genres translate to anime, enter 'list genres')."
        self.user_genres(site) 
        self.results(site)
        puts ""
        puts ""
        puts self.timer 
        puts "Would you like to try again with new entries?"
        self.binary 
    end 

    def user_genres(site)
        list = self.scraper.genre_list(site)
        input = gets.strip
        if input == "list genres"
            puts ""
            puts list.join(", ").gsub(list[list.length - 1], "and #{list[list.length - 1]}")
            self.user_genres(site)
        elsif !input.match(/,/)
            puts ""
            puts "Invalid entry!"
            puts "Please separate each genre with a comma."
            self.user_genres(site)
        elsif input.split(",").length != 3
            puts ""
            puts "Invalid number of genres!"
            puts "Please enter no more or less than 3 genres."
            self.user_genres(site)  
        elsif input.split(",").map{|elem| elem.strip.capitalize}.any?{|ind| !list.include?(ind)}
            puts ""
            puts "Invalid genre!"
            puts "Please enter a genre that can be found in anime, or enter 'list genres' to see your options."
            self.user_genres(site)
        else 
            self.user.genres = input.split(",").map{|genre| genre.strip.capitalize}
        end 
    end 

    def timer
        #start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        #finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        start = Time.now 
        finish = Time.now 
        diff = finish - start # gets time is seconds as a float
    end

end 