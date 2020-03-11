require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "User" do
    let!(:user) { User.new("Bob") }
=begin  
    describe "#name" do 
        it "will read the name" do
            user_name = user.instance_variable_get(:@name)

            expect(user_name).to_eq("Bob")
        end 
    end
=end 
    describe "#genres" do 
        it "will read @genres as array" do
            inter = Interface.new(user)
            inter.user_genres

            allow($stdin).to receive(:gets).and_return("Action", "Fantasy", "Thriller")
            genres = $stdin.gets

            user_genres = user.instance_variable_get(:@genres)

            expect(user_genres).to be_a(Array)
            expect(user_genres).to_eq([genres]) #"Action", "Fantasy", "Thriller"
        end
    end

end 