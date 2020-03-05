class User

    attr_accessor :name, :genres

    @@all = []

    def initialize(name)
        @name = name 
        self.save 
    end 

    def self.save 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

end 