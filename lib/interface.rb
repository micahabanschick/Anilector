class Anilector::Interface

    attr_accessor :scraper, :name, :genres

    @@all = []

    def initialize(scraper=Anilector::Scraper.new)  
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
        puts "Welcome #{self.name}, and good luck!"
    end 

    def user_name
        puts "Pleaser enter you name here"
        input_name = gets.strip
        @name = input_name 
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

    def choices
        includes_one = self.scraper.anime_options(self.genres)

        includes_two = includes_one.map{|genre| genre[:anime].filter{|anime| anime[:genres].include?(self.genres[0]) && anime[:genres].include?(self.genres[1]) || anime[:genres].include?(self.genres[0]) && anime[:genres].include?(self.genres[2]) || anime[:genres].include?(self.genres[1]) && anime[:genres].include?(self.genres[2])}}.flatten.uniq 
        
        includes_three = includes_two.filter{|anime| anime[:genres].include?(self.genres[0]) && anime[:genres].include?(self.genres[1]) && anime[:genres].include?(self.genres[2])}

        if includes_three.length > 0
            includes_three
        elsif includes_two.length > 0 
            includes_two 
        else 
            includes_one  
        end 
    end
    
    def results
        choices = self.choices
        self.timer_finish
        puts self.timer_diff
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
            self.final_step(results)
            self.preview(results)
            self.recommendation_block(results, 2)
        else
            results = choices.filter{|anime| choices.index(anime) < 3}
            self.final_step(results)
            self.preview(results)
            self.recommendation_block(results, 3)
        end 
    end 
    
    def recommendation_block(array, size)
        best = gets.strip
        if size == 3 
            case best 
            when "1"
                self.recommendation(array, 0)
            when "2"
                self.recommendation(array, 1)
            when "3"
                self.recommendation(array, 2)
            else 
                puts "Invalid entry!"
                puts "Please enter #{self.final_length(3)}."
                self.results
            end
        elsif size == 2  
            case best 
            when "1"
                self.recommendation(array, 0)
            when "2"
                self.recommendation(array, 1)
            else 
                puts "Invalid entry!"
                puts "Please enter #{self.final_length(2)}."
                self.results
            end
        end
    end

    def final_step(array)
        puts ""
        puts ""
        puts "We've narrowed your search down to two choices."
        puts "This final step is up to YOU!"
        puts "We'll provide a synopsis of each and you'll pick which description sounds the most appealing by entering #{self.final_length(array)}."
    end

    def final_length(length)
        if length == 2
            "\"1\" or \"2\""
        elsif length == 3 
            "\"1\", \"2\", or \"3\""
        end 
    end

    def recommendation(array, index)
        puts "We recommend you start with this #{array[index][:genres][0]} series called #{array[index][:name]}."
        puts "We hope you enjoy!"
    end 

    def preview(array)
        array.each do |element|
            puts ""
            puts "#{array.index(element) + 1}:"
            puts element[:synopsis] 
        end 
    end

    def run
        self.start 
        puts ""
        puts "Please enter your three favorite genres (if you would like to see what genres translate to anime, enter 'list genres')."
        self.user_genres 
        self.timer_start
        self.results
        puts ""
        puts "" 
        puts "Would you like to try again with new entries?"
        self.binary 
    end 

    def user_genres
        list = self.scraper.genre_list
        input = gets.strip
        if input == "list genres"
            puts ""
            puts list.join(", ").gsub(list[list.length - 1], "and #{list[list.length - 1]}")
            self.user_genres
        elsif !input.match(/,/)
            puts ""
            puts "Invalid entry!"
            puts "Please separate each genre with a comma."
            self.user_genres
        elsif input.split(",").length != 3
            puts ""
            puts "Invalid number of genres!"
            puts "Please enter no more or less than 3 genres."
            self.user_genres 
        elsif input.split(",").map{|elem| elem.strip.capitalize}.any?{|ind| !list.include?(ind)}
            puts ""
            puts "Invalid genre!"
            puts "Please enter a genre that can be found in anime, or enter 'list genres' to see your options."
            self.user_genres
        else 
            @genres = input.split(",").map{|genre| genre.strip.capitalize}
            self.genres.each{|genre| Anilector::Genre.new(genre) if Anilector::Genre.all.find{|gen| gen.name == genre} == nil}
        end 
    end 

    def timer_start
        start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        #finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        #diff = finish - start # gets time is seconds as a float
    end

    def timer_finish
        finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    end

    def timer_diff
        diff = self.timer_finish - self.timer_start 
    end 

end 