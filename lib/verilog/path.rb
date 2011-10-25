
module Verilog

  class Path
    attr_reader :files

    def initialize( path="" )
      @files = []
      load_path( path )
    end

    def load_path( paths )
      #path is single string or array of strings
      paths.each do |path|
        files = Dir.glob( ::File.join( path, '*.*') )
        files.each do |file|
          #Skip if Directory got passed *.* Filter
          next if ::File.directory?( file )

          file_name = ::File.basename(file)  
          @files << Verilog::File.new(file_name, {:path => path})

        end
      end
    end

    def load_file file 
      @files << Verilog::File.new( file )
    end

    def read_all
      @files.each do |file|
        file.read_from_disk
      end
    end

    def find_by_module( name )
      result = @files.select do |file|
         file.module_name == name 
      end

      return result[0]
    end

    def includes_file( name )
        @files.select { |file| file.includes.include?( name ) }
    end

    def instantiates_module( name )
        @files.select { |file| file.instantiations.include?( name ) }
    end

  end

end

