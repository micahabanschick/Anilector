require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "User" do
    let!(:user) { User.new("Bob") }
  
    describe "@@all" do
        it "is initialized as an empty array" do
          all = User.class_variable_get(:@@all)
    
          expect(all).to match_array([])
        end
    end

    describe "#initialize" do
        it "will create new user" do
            new_method = User.new("Bob")

            new_method_method = new_method.instance_variable_get(:@name)

            expect(new_song_name).to eq("Something")
        end

        it "will initialize with a name" do
            new_method = User.new("Katy")

            new_method_name = new_method.instance_variable_get(:@name)

            expect(new_method_name).to eq("Katy")
        end
        
        it "will save user to @@all" do
            new_method_method = usr.instance_variable_get(:@name)
        
            expect(new_song_name).to eq("Something")
        end
    end

    describe ".save" do
        it "will save self to @@all" do
            new_method = User.new("Bob")

            new_method_method = new_method.instance_variable_get(:@name)

            expect(new_method_method).to eq("Something")
        end
    end

    describe ".all" do
        it "returns the class variable @@all" do
            expect(User.all).to match_array([])

            User.class_variable_set(:@@all, [song])

            expect(User.all).to match_array([song])
        end
    end

    describe "#name" do 
        it "will read the name" do
            user_name = user.instance_variable_get(:@name)

            expect(user_name).to_eq("Bob")
        end 
    end

    describe "#genres" do
        it "will ask user for 3 genres" do
            expect(user.genres).to receive(:gets).and_return("Action, Fantasy, Thriller") 
        end 

        it "will read @genres as array" do
            new_method_method = user.instance_variable_get(:@genres)

            expect(user.genres).to be_a(Array)
        end
    end

end 