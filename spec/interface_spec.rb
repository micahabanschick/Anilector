require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "Interface" do
    let(:interface) { Interface.new(User.new("Bob")) }
  
    describe "#run" do
      it "will run the program" do
        #new_method_method = interface.instance_variable_get(:@name)
  
        expect(interface.user.name).to eq("Bob")
      end
    end

end 