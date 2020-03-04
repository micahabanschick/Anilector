require_relative '../config/environment.rb'

describe "User" do
    let(:song) { Song.new("In the Aeroplane Over the Sea") }
  
    describe "#to_be_determined" do
        it "will be decided in the future" do
        new_method = Scraper.new

        new_method_method = new_method.instance_variable_get(:@name)

        expect(new_song_name).to eq("Something")
        end
    end

    describe "#initialize" do
        it "will create new user" do
            new_method = User.new

            new_method_method = new_method.instance_variable_get(:@name)

            expect(new_song_name).to eq("Something")
        end

        it "will initialize with a name" do
            new_method = User.new

            new_method_method = new_method.instance_variable_get(:@name)

            expect(new_song_name).to eq("Something")
        end
        
        it "will save user to @@all" do
            new_method = User.new
        
            new_method_method = new_method.instance_variable_get(:@name)
        
            expect(new_song_name).to eq("Something")
        end
    end

    describe "#self.save" do
        it "will save self to @@all" do
        new_method = User.new

        new_method_method = new_method.instance_variable_get(:@name)

        expect(new_song_name).to eq("Something")
        end
    end

    describe "#self.all" do
        it "will read @@all" do
        new_method = User.new

        new_method_method = new_method.instance_variable_get(:@name)

        expect(new_song_name).to eq("Something")
        end
    end

    describe "#genres" do
        it "will read @genres as array" do
        new_method = User.new

        new_method_method = new_method.instance_variable_get(:@name)

        expect(new_song_name).to eq("Something")
        end
    end

end 