require_relative '../config/environment.rb'
require_relative './spec_helper.rb'

describe "Interface" do
    let(:interface) { Interface.new(User.new("Bob")) }
  
    describe "#to_be_determined" do
      it "will be decided in the future" do
        #new_method_method = interface.instance_variable_get(:@name)
  
        expect(interface.user.name).to eq("Bob")
      end
    end

end 