require 'spec_helper'

describe Verilog do

  it "Open file" do
    
    path = File.dirname( __FILE__ )
    
    test_one = Verilog::File.new("test_one.v", {:path => File.join( path, 'test_examples') })
    test_one.read_from_disk

    test_one.contents.should    == 
%{module TEST_ONE(
  input rx,
  output tx
);

endmodule
}

  
  end

end
