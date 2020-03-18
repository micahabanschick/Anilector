require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "Anilector::Genre" do
    let!(:genre) { Anilector::Genre.new("Action") }

    let!(:genre_details) { {:genre=>"Action", :anime=>[
        {:name=>"Shingeki no Kyojin", :genres=>["Action", "Military", "Mystery", "Super Power", "Drama", "Fantasy", "Shounen"]},
        {:name=>"Sword Art Online", :genres=>["Action", "Adventure", "Fantasy", "Game", "Romance"]},
        {:name=>"Fullmetal Alchemist: Brotherhood", :genres=>["Action", "Military", "Adventure", "Comedy", "Drama", "Magic", "Fantasy", "Shounen"]},
        {:name=>"One Punch Man", :genres=>["Action", "Sci-Fi", "Comedy", "Parody", "Super Power", "Supernatural"]},
        {:name=>"Tokyo Ghoul", :genres=>["Action", "Mystery", "Horror", "Psychological", "Supernatural", "Drama", "Seinen"]}]} }
 
    describe "#name" do 
        it "will read the name" do
            genre_name = genre.instance_variable_get(:@name)

            expect(genre_name).to eq("Action")
        end 
    end
 
    describe "#details" do 
        it "will read the hash of details for this genre" do
            interface = Anilector::Interface.new 
            interface.genres = ["Action","Comedy","Drama"]
            scraper = Anilector::Scraper.new
            
            details = genre.details

            expect(details).to include(genre_details)
        end
    end

end 