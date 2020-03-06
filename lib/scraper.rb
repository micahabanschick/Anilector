class Scraper

    def anime(site) 
        #binding.pry
        document = Nokogiri::HTML.parse(open(site))
        anime_pages = document.css("a.icon-watch.ml8")[0].attributes.values[0].value
        #anime_page_docs = Nokogiri::HTML.parse(open(anime_page))
    end 

    def anime_from_each_genre(site)
    end 

end 