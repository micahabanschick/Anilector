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
        {:genre=>"Thriller", :anime=>[ #this one includes synopses!!!!!!!
            {:name=>"Death Note", :genres=>["Mystery", "Police", "Psychological", "Supernatural", "Thriller", "Shounen"], :synopsis=>
                "A shinigami, as a god of death, can kill any person—provided they see their victim's face and write their victim's name in a notebook called a Death Note. One day, Ryuk, bored by the shinigami lifestyle and interested in seeing how a human would use a Death Note, drops one into the human realm.

                High school student and prodigy Light Yagami stumbles upon the Death Note and—since he deplores the state of the world—tests the deadly notebook by writing a criminal's name in it. When the criminal dies immediately following his experiment with the Death Note, Light is greatly surprised and quickly recognizes how devastating the power that has fallen into his hands could be.
        
                With this divine capability, Light decides to extinguish all criminals in order to build a new world where crime does not exist and people worship him as a god. Police, however, quickly discover that a serial killer is targeting criminals and, consequently, try to apprehend the culprit. To do this, the Japanese investigators count on the assistance of the best detective in the world: a young and eccentric man known only by the name of L.
        
                [Written by MAL Rewrite]"},
            {:name=>"Steins;Gate", :genres=>["Thriller", "Sci-Fi"], :synopsis=>
                "The self-proclaimed mad scientist Rintarou Okabe rents out a room in a rickety old building in Akihabara, where he indulges himself in his hobby of inventing prospective \"future gadgets\" with fellow lab members: Mayuri Shiina, his air-headed childhood friend, and Hashida Itaru, a perverted hacker nicknamed \"Daru.\" The three pass the time by tinkering with their most promising contraption yet, a machine dubbed the \"Phone Microwave,\" which performs the strange function of morphing bananas into piles of green gel.

                Though miraculous in itself, the phenomenon doesn't provide anything concrete in Okabe's search for a scientific breakthrough; that is, until the lab members are spurred into action by a string of mysterious happenings before stumbling upon an unexpected success—the Phone Microwave can send emails to the past, altering the flow of history.
                
                Adapted from the critically acclaimed visual novel by 5pb. and Nitroplus, Steins;Gate takes Okabe through the depths of scientific theory and practicality. Forced across the diverging threads of past and present, Okabe must shoulder the burdens that come with holding the key to the realm of time.
                
                [Written by MAL Rewrite]"},
            {:name=>"Mirai Nikki", :genres=>["Action", "Mystery", "Psychological", "Shounen", "Supernatural", "Thriller"], :synopsis=>
                "Lonely high school student, Yukiteru Amano, spends his days writing a diary on his cellphone, while conversing with his two seemingly imaginary friends Deus Ex Machina, who is the god of time and space, and Murmur, the god's servant. Revealing himself to be an actual entity, Deus grants Yukiteru a \"Random Diary,\" which shows highly descriptive entries based on the future and forces him into a bloody battle royale with 11 other holders of similarly powerful future diaries.

                With the last person standing designated as the new god of time and space, Yukiteru must find and kill the other 11 in order to survive. He reluctantly teams up with his obsessive stalker Yuno Gasai (who also possesses such a diary), and she takes it upon herself to ensure his safety. But there's more to the girl than meets the eye, as she might have other plans for her unrequited love...
                
                [Written by MAL Rewrite]"},
            {:name=>"Re:Zero kara Hajimeru Isekai Seikatsu", :genres=>["Psychological", "Drama", "Thriller", "Fantasy"], :synopsis=>
                "When Subaru Natsuki leaves the convenience store, the last thing he expects is to be wrenched from his everyday life and dropped into a fantasy world. Things aren't looking good for the bewildered teenager; however, not long after his arrival, he is attacked by some thugs. Armed with only a bag of groceries and a now useless cell phone, he is quickly beaten to a pulp. Fortunately, a mysterious beauty named Satella, in hot pursuit after the one who stole her insignia, happens upon Subaru and saves him. In order to thank the honest and kindhearted girl, Subaru offers to help in her search, and later that night, he even finds the whereabouts of that which she seeks. But unbeknownst to them, a much darker force stalks the pair from the shadows, and just minutes after locating the insignia, Subaru and Satella are brutally murdered.

                However, Subaru immediately reawakens to a familiar scene—confronted by the same group of thugs, meeting Satella all over again—the enigma deepens as history inexplicably repeats itself.
                
                [Written by MAL Rewrite]"},
            {:name=>"Another", :genres=>["Mystery", "Horror", "Supernatural", "Thriller", "School"], :synopsis=>"In 1972, a popular student in Yomiyama North Middle School's class 3-3 named Misaki passed away during the school year. Since then, the town of Yomiyama has been shrouded by a fearful atmosphere, from the dark secrets hidden deep within.

                Twenty-six years later, 15-year-old Kouichi Sakakibara transfers into class 3-3 of Yomiyama North and soon after discovers that a strange, gloomy mood seems to hang over all the students. He also finds himself drawn to the mysterious, eyepatch-wearing student Mei Misaki; however, the rest of the class and the teachers seem to treat her like she doesn't exist. Paying no heed to warnings from everyone including Mei herself, Kouichi begins to get closer not only to her, but also to the truth behind the gruesome phenomenon plaguing class 3-3 of Yomiyama North.
                
                Another follows Kouichi, Mei, and their classmates as they are pulled into the enigma surrounding a series of inevitable, tragic events—but unraveling the horror of Yomiyama may just cost them the ultimate price.
                
                [Written by MAL Rewrite]"}
        ]}   
    ]}

    let!(:list_of_genres) {[
        "Action","Adventure","Cars","Comedy","Dementia","Demons","Drama","Ecchi","Fantasy","Game","Harem","Hentai","Historical","Horror","Josei","Kids","Magic","Martial Arts","Mecha","Military","Music","Mystery","Parody","Police","Psychological","Romance","Samurai","School","Sci-Fi","Seinen","Shoujo","Shoujo Ai","Shounen","Shounen Ai","Slice of Life","Space","Sports","Super Power","Supernatural","Thriller","Vampire","Yaoi","Yuri"
    ]}


    let!(:another_synopsis) { "In 1972, a popular student in Yomiyama North Middle School's class 3-3 named Misaki passed away during the school year. Since then, the town of Yomiyama has been shrouded by a fearful atmosphere, from the dark 
        secrets hidden deep within.\n\n            Twenty-six years later, 15-year-old Kouichi Sakakibara transfers into class 3-3 of Yomiyama North and soon after discovers that a strange, gloomy mood seems to hang over all the students. He also finds himself drawn to the mysterious, eyepatch-wearing student Mei Misaki; however, the rest of the class and the teachers seem to treat her like she doesn't exist. Paying no heed to warnings from everyone including Mei herself, Kouichi begins to get closer not only to her, but also to the truth behind the gruesome phenomenon plaguing class 3-3 of Yomiyama North.\n            \n            Another follows Kouichi, Mei, and their classmates as they are 
        pulled into the enigma surrounding a series of inevitable, tragic events\u2014but unraveling the horror of Yomiyama may just cost them the ultimate price.\n            \n            [Written by MAL Rewrite]"
    }

    let!(:inner_hash_example) {
        {:name=>"Another", :genres=>["Mystery","Horror","Supernatural","Thriller","School"], :synopsis=>"In 1972, a popular student in Yomiyama North Middle School's class 3-3 named Misaki passed away during the school year. Since then, the town of Yomiyama has been shrouded by a fearful atmosphere, from the dark secrets hidden deep within.

            Twenty-six years later, 15-year-old Kouichi Sakakibara transfers into class 3-3 of Yomiyama North and soon after discovers that a strange, gloomy mood seems to hang over all the students. He also finds himself drawn to the mysterious, eyepatch-wearing student Mei Misaki; however, the rest of the class and the teachers seem to treat her like she doesn't exist. Paying no heed to warnings from everyone including Mei herself, Kouichi begins to get closer not only to her, but also to the truth behind the gruesome phenomenon plaguing class 3-3 of Yomiyama North.
            
            Another follows Kouichi, Mei, and their classmates as they are pulled into the enigma surrounding a series of inevitable, tragic events—but unraveling the horror of Yomiyama may just cost them the ultimate price.
            
            [Written by MAL Rewrite]"}
    }
    
    describe "#synopsis" do
        it "will return the anime synopsis" do
            anime_url = "https://myanimelist.net/anime.php"

            scraped_synopsis = scraper.synopsis(anime_url, ["Action", "Fantasy", "Thriller"], 2, 4)

            expect(scraped_synopsis).to include(another_synopsis)
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

    describe "#inner_hash" do
        it "will return a hash of an anime's information" do 
            anime_url = "https://myanimelist.net/anime.php"

           scraped_inner_hash = scraper.inner_hash(anime_url, ["Action", "Fantasy", "Thriller"], 2, 4)

           expect(scraped_inner_hash).to include(inner_hash_example)
        end 
    end

    describe "#anime_options" do
        it "will scrape the top 5 anime from each genre on MAL into a hash" do
            anime_url = "https://myanimelist.net/anime.php"

            scraped_anime = scraper.anime_options(anime_url, ["Action", "Fantasy", "Thriller"])

            expect(scraped_anime).to include(anime_array[2])
            #expect(scraped_anime).to include(anime_array[0], anime_array[1], anime_array[2])
        end
    end

end 