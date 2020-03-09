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