require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "Interface" do
    let(:interface) { Interface.new }
  
    describe "#run" do
      it "will run the program" do        
=begin 
        anime_url = "https://myanimelist.net/anime.php"
        program_run = interface.run(anime_url)

        expect(program_run).to include(user.binary)
      end

      it "will ask to be run again" do
        #new_method_method = interface.instance_variable_get(:@name)
        anime_url = "https://myanimelist.net/anime.php"
        program_run = interface.run(anime_url)

        allow($stdin).to receive(:gets).and_return("Would you like to try again with new entries?")
        question = $stdin.gets
        
        expect(program_run).to include(question)
=end         
      end
    end

end 
