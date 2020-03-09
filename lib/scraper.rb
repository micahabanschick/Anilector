class Scraper


    def anime_from_each_genre(site, genres)
        #an array whose elements reveal the information for 5 anime from each given genre
        #binding.pry 
        outer_array = [outer_hash(site, genres, 0), outer_hash(site, genres, 1), outer_hash(site, genres, 2)]
        #binding.pry
    end 

    def genre_list(site) 
        document = doc(site)
        document.css("div.genre-list.al").map{|genre| genre.text.gsub(/(\(\d{1}\,?\d+\))/,"").strip if genre.children[0].attributes.values[0].value.include?("/genre/")}.filter{|text| text != nil}
    end

    def appendage(site, genres, index)
        #end piece added on to the site to get to the genre's page
        doc(site).css("a.genre-name-link").find{|genre| genre.text.match(genres[index])}.attributes.values[0].value
    end 

    def genre_site(site, genres, index)
        #url for genre's page
        site.gsub("/anime.php", appendage(site, genres, index))
    end 

    def doc(site)   
        Nokogiri::HTML.parse(open(site))
    end

    def anime_name(site, genres, doc_index, anime_index)
        #shortcut to get to the anime's name
        document = doc(genre_site(site, genres, doc_index))
        document.css("p.title-text")[anime_index].text.strip
    end 

    def anime_genres(site, genres, doc_index, anime_index)
        #shortcut to get an array of the anime's genres
        document = doc(genre_site(site, genres, doc_index))
        document.css("div.genres-inner.js-genre-inner")[anime_index].children.map{|genre| genre.text.strip}
    end

    def inner_hash(site, genres, doc_index, anime_index)
        {:name=>anime_name(site, genres, doc_index, anime_index), :genres=>anime_genres(site, genres, doc_index, anime_index)}
    end

    def inner_array(site, genres, doc_index)
        i = 0
        arr = []
        while i < 5 do 
            arr << inner_hash(site, genres, doc_index, i)
            i += 1
        end
        arr 
    end 

    def outer_hash(site, genres, index)
        {:genre=>genres[index], :anime=>inner_array(site, genres, index)}
    end
#binding.pry
end 