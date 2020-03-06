class User

    attr_accessor :name, :genres, :media 

    @@all = []

    def initialize(name="Stranger")
        @name = name 
        self.save 
    end 

    def save 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def genres
        puts "Please insert your top 3 favorite genres from most favorite to least favorite."
        genre_input = gets.strip
        genre_array = genre_input.split(",").map{|genre| genre.strip}
        @genres = genre_array.map{|genre| {:genre=>0}}
    end 

end 