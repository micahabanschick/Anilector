class Scraper


    def anime_from_each_genre(site, genres)
        #binding.pry 
        document_1 = doc(genre_site(site,genres,0))
        name = anime_name(site, genres, 0, 0) 
        genress = anime_genres(site, genres, 0, 0)
        #binding.pry
    end 

    def appendage(site, genres, index)
        doc(site).css("a.genre-name-link").find{|genre| genre.text.match(genres[index])}.attributes.values[0].value
    end 

    def genre_site(site, genres, index)
        site.gsub("/anime.php", appendage(site, genres, index))
    end 

    def doc(site)
        Nokogiri::HTML.parse(open(site))
    end

    def anime_name(site, genres, doc_index, anime_index)
        document = doc(genre_site(site, genres, doc_index))
        document.css("p.title-text")[anime_index].text.strip
    end 

    def anime_genres(site, genres, doc_index, anime_index)
        document = doc(genre_site(site, genres, doc_index))
        document.css("div.genres-inner.js-genre-inner")[anime_index].children.map{|genre| genre.text.strip}
    end
#binding.pry
end 