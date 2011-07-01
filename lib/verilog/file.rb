
module Verilog

  class File #< Class::File
    attr_reader :filename, :options
    attr_accessor :contents

    def initialize( filename, options={} )
      @filename         = filename
      @options          = options
      @options[:path] ||= ''
    end

    #Alias method
    def read_from_disk
      read()
    end

    def read
      if Class::File.exist?( absolute_filename )
        @contents = ''
        f = Class::File.open(absolute_filename, "r") 
        f.each_line do |line|
          @contents += line
        end
        f.close
      else
        #TODO raise correct exception here
        puts "ERROR File Not Found #{absolute_filename}"
      end

    end

    def save
      f = Class::File.open( absolute_filename, "w" )
      f.write @contents
      f.close
    end

    def absolute_filename
      Class::File.join( @options[:path], @filename ) 
    end

  end

end
