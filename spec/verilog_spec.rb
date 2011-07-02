require 'spec_helper'
require 'pp'

describe Verilog do

  it "Open file" do
    path = File.dirname( __FILE__ )

    test_one = Verilog::File.new("test_one.v", {:path => File.join( path, 'fixtures') })
    test_one.read_from_disk

    test_one.contents.should    == 
%{module TEST_ONE(
  input rx,
  output tx
);

endmodule
}
    test_one.module_name.should == "TEST_ONE"
  end


  it "Save to file" do
    path = File.dirname( __FILE__ )

    test_two = Verilog::File.new("test_two.v", {:path => File.join( path, 'fixtures') })
    test_two.contents = 
%{module TEST_TWO(
  input rx,
  output tx
);}
      test_two.save

    ##Check file exists
    File.exists?( test_two.absolute_filename ).should == true

    ##Check content here
    contents = File.open(test_two.absolute_filename, "rb").read
    contents.should == 
%{module TEST_TWO(
  input rx,
  output tx
);}

      File.delete( test_two.absolute_filename )
  end

  it "Check Instantiations" do
    path = File.dirname( __FILE__ )

    test_three = Verilog::File.new("test_three.v", {:path => File.join( path, 'fixtures') })
    test_three.read_from_disk

    test_three.instantiations.should == ["TEST_ONE", "TEST_TWO", "TEST_FOUR", "TEST_FIVE"]
  end

  it "Check Includes" do
    path = File.dirname( __FILE__ )

    test_four = Verilog::File.new("test_four.vh", {:path => File.join( path, 'fixtures') })
    test_four.read_from_disk

    test_four.includes.should == ["test_one.v", "test_three.v"]
  end

end
