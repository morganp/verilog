require 'spec_helper'
require 'pp'

describe Verilog do

  it "Load file.list with init" do
    test_path = File.join( File.dirname( __FILE__ ), 'fixtures' )
    ## Set working directory for relative file.list includes
    Dir.chdir( test_path )

    list_one = Verilog::FileList.new( File.join( test_path, 'file.list' ) )
    answer = 
      ["file_one.txt",
      "file_two.txt",
      "secondary_file_list_file1",
      "secondary_file_list_file2",
      "file_three.txt",
      "inc_dir_test/incdir_file_one.txt",
      "inc_dir_test/incdir_file_two.txt",
      "file_four.txt",
      ]
    
    list_one.files.inspect.should    == answer.inspect
    
  end
  it "Load file.list with parse list" do
    test_path = File.join( File.dirname( __FILE__ ), 'fixtures' )
    ## Set working directory for relative file.list includes
    Dir.chdir( test_path )

    #No bang method, returns array.
    list_one = Verilog::FileList.new().parse_list( File.join( test_path, 'file.list' ) )
    answer = 
      ["file_one.txt",
      "file_two.txt",
      "secondary_file_list_file1",
      "secondary_file_list_file2",
      "file_three.txt",
      "inc_dir_test/incdir_file_one.txt",
      "inc_dir_test/incdir_file_two.txt",
      "file_four.txt",
      ]
    
    list_one.inspect.should    == answer.inspect
    
  end

end
