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
    describe "#name" do 
        it "will read @genres as array" do
            new_genres = user.instance_variable_get(:@genres)

            expect(user_genres).to be_a(Array)
            expect(user_genres).to_eq(["Action", "Fantasy", "Thriller"])
        end
    end

end 