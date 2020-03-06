class Scraper

    def anime_from_each_genre(site)
        binding.pry 
        document = Nokogiri::HTML.parse(open(site))
    end 

end 