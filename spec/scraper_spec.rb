require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "Scraper" do
    let!(:scraper) { Scraper.new }

    let!(:anime_array) {[{:name=>"Fullmetal Alchemist: Brotherhood", :genres=>["Action", "Military", "Adventure", "Comedy", "Drama", "Magic", "Fantasy", "Shounen"]},
                            {:name=>"Gintama°", :genres=>["Action", "Comedy", "Historical", "Parody", "Samurai", "Sci-Fi", "Shounen"]}]}
  
    describe "#to_be_determined" do
      it "will be decided in the future" do
        new_method = Scraper.new
  
        new_method_method = new_method.instance_variable_get(:@name)
  
        expect(new_song_name).to eq("Something")
      end
    end

    describe "#anime" do
        it "will scrape the top 20 anime off of MAL" do
          #scraper = Scraper.new
    
          anime_method = scraper.anime("https://myanimelist.net/topanime.php")
    
          expect(anime_method).to eq(anime_array)
        end
      end

      describe "#anime_from_each_genre" do
        it "will scrape the top 3 anime from each genre on MAL into a hash" do
          new_method = Scraper.new
    
          new_method_method = new_method.instance_variable_get(:@name)
    
          expect(new_song_name).to eq("Something")
        end
      end

      describe "#media_genres" do
        it "will scrape the user's 5 given movies or shows from IMBd" do
          new_method = Scraper.new
    
          new_method_method = new_method.instance_variable_get(:@name)
    
          expect(new_song_name).to eq("Something")
        end
      end

end 