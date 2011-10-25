require 'spec_helper'
require 'pp'

describe Verilog do

  it "initialize with folder" do
    path = File.dirname( __FILE__ )

    test_one = Verilog::Path.new( File.join( path, 'fixtures' ) )
    test_one.read_all

    answer = Verilog::File.new( File.join( path, 'fixtures', 'test_one.v' ) )
    answer.read
    test_one.find_by_module( "TEST_ONE" ).inspect.should    == answer.inspect
    
  end
  
  it "initialize with no args" do
    path = File.dirname( __FILE__ )

    test_one = Verilog::Path.new( )
    test_one.read_all

    answer = nil# Verilog::File.new( File.join( path, 'fixtures', 'test_one.v' ) )
    test_one.find_by_module( "TEST_ONE" ).inspect.should    == answer.inspect
    
  end
  
  it "initialize with no args, and load_file" do
    path = File.dirname( __FILE__ )

    test_one = Verilog::Path.new( )
    test_one.load_file( File.join( path, 'fixtures', 'test_one.v' ) )
    test_one.read_all

    answer = Verilog::File.new( File.join( path, 'fixtures', 'test_one.v' ) )
    answer.read
    test_one.find_by_module( "TEST_ONE" ).inspect.should    == answer.inspect
    
  end

end
