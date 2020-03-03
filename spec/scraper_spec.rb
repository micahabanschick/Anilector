require_relative '../config/environment.rb'

describe "Scraper" do
    let(:song) { Song.new("In the Aeroplane Over the Sea") }
  
    describe "#to_be_determined" do
      it "will be decided in the future" do
        new_method = Scraper.new
  
        new_method_method = new_method.instance_variable_get(:@name)
  
        expect(new_song_name).to eq("Something")
      end
    end

end 