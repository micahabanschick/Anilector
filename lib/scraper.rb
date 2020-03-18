class Anilector::Scraper
    
    attr_accessor :site 

    def initialize
        @site = "https://myanimelist.net/anime.php" 
    end 

    def anime_options(genres)
        #an array whose elements reveal the information for 5 anime from each given genre
        #binding.pry
        i = 0
        outer_array = []#[Anilector::Genre.all.find{|genre| genre.name == genres[0]}, Anilector::Genre.all.find{|genre| genre.name == genres[1]}, Anilector::Genre.all.find{|genre| genre.name == genres[2]}]
        while i < 3 do 
            #if Anilector::Genre.all.find{|genre| genre.name == genres[i]} != nil 
            #    outer_array << Anilector::Genre.all.find{|genre| genre.name == genres[i]}.details 
            #else 
            #    outer_array << outer_hash(site, genres, i)
            #end 
            outer_array << Anilector::Genre.all.find{|genre| genre.name == genres[i]}.details
            i += 1
        end
        outer_array
    end 

    def synopsis(genres, doc_index, anime_index)
        #returns the plot of the given anime 
        doc(anime_site(genres, doc_index, anime_index)).css("span[itemprop=\"description\"]").text
        #binding.pry
    end 

    def genre_list 
        #an array that includes every genre name listed on the site
        doc(self.site).css("div.genre-list.al").map{|genre| genre.text.gsub(/(\(\d{1}\,?\d+\))/,"").strip if genre.children[0].attributes.values[0].value.include?("/genre/")}.filter{|text| text != nil}
    end

    def appendage(genres, doc_index)
        #end piece added on to the site to get to the genre's page
        doc(self.site).css("a.genre-name-link").find{|genre| genre.text.match(genres[doc_index])}.attributes.values[0].value
    end 

    def anime_site(genres, doc_index, anime_index)
        doc(genre_site(genres, doc_index)).css("a.link-title")[anime_index].attributes.values[0].value
    end

    def genre_site(genres, doc_index)
        #url for genre's page
        site_dup = self.site.dup 
        site_dup["/anime.php"] = appendage(genres, doc_index)
        site_dup
    end 

    def doc(site)   
        Nokogiri::HTML.parse(open(site))
    end

    def anime_name(genres, doc_index, anime_index)
        #shortcut to get to the anime's name
        doc(genre_site(genres, doc_index)).css("p.title-text")[anime_index].text.strip
    end 

    def anime_genres(genres, doc_index, anime_index)
        #shortcut to get an array of the anime's genres
        doc(genre_site(genres, doc_index)).css("div.genres-inner.js-genre-inner")[anime_index].children.map{|genre| genre.text.strip}
    end

    def inner_hash(genres, doc_index, anime_index)
        {:name=>anime_name(genres, doc_index, anime_index), :genres=>anime_genres(genres, doc_index, anime_index), :synopsis=>synopsis(genres, doc_index, anime_index)}
    end

    def inner_array(genres, doc_index)
        i = 0
        arr = []
        while i < 5 do 
            arr << inner_hash(genres, doc_index, i)
            i += 1
        end
        arr 
    end 

    def outer_hash(genres, doc_index)
       hash = {:genre=>genres[doc_index], :anime=>inner_array(genres, doc_index)}
    end
#binding.pry
end 