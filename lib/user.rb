class User

    attr_accessor :name, :genres, :media 

    @@all = []

    def initialize(name=nil)
        @name = name if name != nil 
        self.save 
    end 

    def save 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def genres=(genres)
        puts "Please insert your top 3 favorite genres from most favorite to least favorite."
        genre_input = gets.strip
        genre_array = genre_input.split(",").map{|genre| genre.strip}
        @genres = genre_array.map{|genre| {:gengre=>0}}
    end 

    def media=(media)
        puts "Please insert your top 5 favorite movies and/or shows from most favorite to least favorite"
        medium_input = gets.strip 
        medium_array = medium_input.split(",").map{|medium| medium.strip}
        @media = medium_array
    end 

end 