
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
      if ::File.exist?( absolute_filename )
        ::File.open( absolute_filename, "rb") do |f| 
          @contents = f.read 
        end
      else
        #TODO raise correct exception here
        puts "ERROR File Not Found #{absolute_filename}"
      end

    end

    def save
      ::File.open( absolute_filename, "w" ) do |f|
        f.write @contents
      end
    end

    def absolute_filename
      ::File.join( @options[:path], @filename ) 
    end

  end

end
