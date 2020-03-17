class Anilector::Genre 

    attr_accessor :name, :details

    @@all = []

    def initialize(name)
        @name = name 
        self.save 
    end 

    def save 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

end