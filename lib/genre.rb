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

    def details 
        if Anilector::Interface.all[0].genres[0] == self.name 
            doc_index = 0
        elsif Anilector::Interface.all[0].genres[1] == self.name
            doc_index = 1
        elsif Anilector::Interface.all[0].genres[2] == self.name
            doc_index = 2
        end
        @details ||= Anilector::Scraper.new.outer_hash(Anilector::Interface.all[0].genres, doc_index)
    end

end