require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "Scraper" do
    let(:song) { Song.new("In the Aeroplane Over the Sea") }
  
    describe "#to_be_determined" do
      it "will be decided in the future" do
        new_method = Scraper.new
  
        new_method_method = new_method.instance_variable_get(:@name)
  
        expect(new_song_name).to eq("Something")
      end
    end

    describe "#top_anime" do
        it "will scrape the top 20 anime off of MAL" do
          new_method = Scraper.new
    
          new_method_method = new_method.instance_variable_get(:@name)
    
          expect(new_song_name).to eq("Something")
        end
      end

      describe "#top_anime_from_each_genre" do
        it "will scrape the top 3 anime from each genre on MAL into a hash" do
          new_method = Scraper.new
    
          new_method_method = new_method.instance_variable_get(:@name)
    
          expect(new_song_name).to eq("Something")
        end
      end

      describe "#top_entertainment" do
        it "will scrape the user's 5 given movies or shows from IMBd" do
          new_method = Scraper.new
    
          new_method_method = new_method.instance_variable_get(:@name)
    
          expect(new_song_name).to eq("Something")
        end
      end

end 