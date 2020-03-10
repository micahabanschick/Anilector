require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "Scraper" do
    let!(:scraper) { Scraper.new }

    let!(:anime_array) {[
        {:genre=>"Action", :anime=>[
            {:name=>"Shingeki no Kyojin", :genres=>["Action", "Military", "Mystery", "Super Power", "Drama", "Fantasy", "Shounen"]},
            {:name=>"Sword Art Online", :genres=>["Action", "Adventure", "Fantasy", "Game", "Romance"]},
            {:name=>"Fullmetal Alchemist: Brotherhood", :genres=>["Action", "Military", "Adventure", "Comedy", "Drama", "Magic", "Fantasy", "Shounen"]},
            {:name=>"One Punch Man", :genres=>["Action", "Sci-Fi", "Comedy", "Parody", "Super Power", "Supernatural"]},
            {:name=>"Tokyo Ghoul", :genres=>["Action", "Mystery", "Horror", "Psychological", "Supernatural", "Drama", "Seinen"]}]},
        {:genre=>"Fantasy", :anime=>[
            {:name=>"Shingeki no Kyojin", :genres=>["Action", "Military", "Mystery", "Super Power", "Drama", "Fantasy", "Shounen"]},
            {:name=>"Sword Art Online", :genres=>["Action", "Adventure", "Fantasy", "Game", "Romance"]},
            {:name=>"Fullmetal Alchemist: Brotherhood", :genres=>["Action", "Military", "Adventure", "Comedy", "Drama", "Magic", "Fantasy", "Shounen"]},
            {:name=>"No Game No Life", :genres=>["Game", "Adventure", "Comedy", "Supernatural", "Ecchi", "Fantasy"]},
            {:name=>"Ao no Exorcist", :genres=>["Action", "Demons", "Fantasy", "Shounen", "Supernatural"]}]},
        {:genre=>"Thriller", :anime=>[
            {:name=>"Death Note", :genres=>["Mystery", "Police", "Psychological", "Supernatural", "Thriller", "Shounen"]},
            {:name=>"Steins;Gate", :genres=>["Thriller", "Sci-Fi"]},
            {:name=>"Mirai Nikki", :genres=>["Action", "Mystery", "Psychological", "Shounen", "Supernatural", "Thriller"]},
            {:name=>"Re:Zero kara Hajimeru Isekai Seikatsu", :genres=>["Psychological", "Drama", "Thriller", "Fantasy"]},
            {:name=>"Another", :genres=>["Mystery", "Horror", "Supernatural", "Thriller", "School"]}]},   
    ]}

    let!(:list_of_genres) {[
        "Action","Adventure","Cars","Comedy","Dementia","Demons","Drama","Ecchi","Fantasy","Game","Harem","Hentai","Historical","Horror","Josei","Kids","Magic","Martial Arts","Mecha","Military","Music","Mystery","Parody","Police","Psychological","Romance","Samurai","School","Sci-Fi","Seinen","Shoujo","Shoujo Ai","Shounen","Shounen Ai","Slice of Life","Space","Sports","Super Power","Supernatural","Thriller","Vampire","Yaoi","Yuri"
    ]}

    let!(:death_note_synopsis) {
        "A shinigami, as a god of death, can kill any person—provided they see their victim's face and write their victim's name in a notebook called a Death Note. One day, Ryuk, bored by the shinigami lifestyle and interested in seeing how a human would use a Death Note, drops one into the human realm.
        High school student and prodigy Light Yagami stumbles upon the Death Note and—since he deplores the state of the world—tests the deadly notebook by writing a criminal's name in it. When the criminal dies immediately following his experiment with the Death Note, Light is greatly surprised and quickly recognizes how devastating the power that has fallen into his hands could be.
        With this divine capability, Light decides to extinguish all criminals in order to build a new world where crime does not exist and people worship him as a god. Police, however, quickly discover that a serial killer is targeting criminals and, consequently, try to apprehend the culprit. To do this, the Japanese investigators count on the assistance of the best detective in the world: a young and eccentric man known only by the name of L.
        [Written by MAL Rewrite]"
    }
    
    describe "#synopsis" do
        it "will return the anime synopsis" do
            anime_url = "https://myanimelist.net/anime.php"

            scraped_synopsis = scraper.synopsis(anime_url, ["Action", "Fantasy", "Thriller"], 2, 0)

            expect(scraped_synopsis).to include(death_note_synopsis)
        end
    end 

    describe "#genre_list" do
        it "will output an array" do
            anime_url = "https://myanimelist.net/anime.php"

            scraped_genres = scraper.genre_list(anime_url)

            expect(scraped_genres).to be_a(Array)
        end

        it "will output all possible genres" do
           anime_url = "https://myanimelist.net/anime.php"

           scraped_genres = scraper.genre_list(anime_url)

           expect(scraped_genres).to include(list_of_genres)
       end
    end 

    describe "#anime_from_each_genre" do
         it "will output an array" do
            anime_url = "https://myanimelist.net/anime.php"

            scraped_anime = scraper.anime_from_each_genre(anime_url, ["Action", "Fantasy", "Thriller"])

            expect(scraped_anime).to be_a(Array)
        end

        it "will have :genre and :anime" do
            anime_url = "https://myanimelist.net/anime.php"

            scraped_anime = scraper.anime_from_each_genre(anime_url, ["Action", "Fantasy", "Thriller"])
            
            expect(scraped_anime.first).to have_key(:genre)
            expect(scraped_anime.first).to have_key(:anime)
        end

        it "will scrape the top 5 anime from each genre on MAL into a hash" do
            anime_url = "https://myanimelist.net/anime.php"

            scraped_anime = scraper.anime_from_each_genre(anime_url, ["Action", "Fantasy", "Thriller"])

            expect(scraped_anime).to include(anime_array[0], anime_array[1], anime_array[2])
        end
    end

end 