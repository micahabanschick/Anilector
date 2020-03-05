class Scraper

    def anime(site) 
        #binding.pry
        document = Nokogiri::HTML.parse(open(site))
        document.css()
    end 

    def anime_from_each_genre(site)
    end 

end 