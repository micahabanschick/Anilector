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

    def self.list 
        @@list ||= Anilector::Scraper.new.genre_list
    end

    def details 
        genres = Anilector::Interface.all[0].genres
        doc_index = genres.index(genres.find{|genre| genre == self.name})
        @details ||= Anilector::Scraper.new.outer_hash(genres, doc_index)
    end

end