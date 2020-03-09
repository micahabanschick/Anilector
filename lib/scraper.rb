class Scraper


    def anime_from_each_genre(site, genres)
        #an array whose elements reveal the information for 5 anime from each given genre
        binding.pry 
        outer_array = [outer_hash(site, genres, 0), outer_hash(site, genres, 1), outer_hash(site, genres, 2)]
        #binding.pry
    end 

    def choices(site, genres)
        results = anime_from_each_genre(site, genres)

        includes_two = results.map{|genre| genre[:anime].filter{|anime| anime[:genres].include?(genres[0]) && anime[:genres].include?(genres[1]) || anime[:genres].include?(genres[0]) && anime[:genres].include?(genres[2]) || anime[:genres].include?(genres[1]) && anime[:genres].include?(genres[2])}}.flatten.uniq 

        includes_three = includes_two.filter{|anime| anime[:genres].include?(genres[0]) && anime[:genres].include?(genres[1]) && anime[:genres].include?(genres[2])}

        if includes_three.length > 0
            includes_three
        elsif includes_two.length > 0 
            includes_two 
        else 
            results 
        end 
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