class Anilector::User

    attr_accessor :name, :genres

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
        @genres
    end 

end 