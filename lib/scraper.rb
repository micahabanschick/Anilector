class Scraper


    def anime_from_each_genre(site, genres)
        #binding.pry 
        document = Nokogiri::HTML.parse(open(site))
        genre_document_1 = Nokogiri::HTML.parse(open(genre_site(site,genres,0)))
        binding.pry
    end 

    def appendage(site, genres, index)
        document = Nokogiri::HTML.parse(open(site))
        document.css("a.genre-name-link").find{|genre| genre.text.match(genres[index])}.attributes.values[0].value
    end 

    def genre_site(site, genres, index)
        site.gsub("/anime.php", self.appendage(site, genres, index))
    end 
#binding.pry
end 