
module Verilog

  class File #< Class::File
    attr_reader   :options
    attr_accessor :filename, :contents

    def initialize( filename, options={} )
      @filename         = ::File.basename( filename )
      @options          = options

      options[:path]  ||= ''
      relative_path_added_with_file_name = filename.dup
      #Remove the basename section of the filename
      relative_path_added_with_file_name[@filename] = ''

      @options[:path] = ::File.join( options[:path], relative_path_added_with_file_name )
    end

    def inspect
      [":options => #{@options.inspect}", ":filename => #{@filename}", ":contents => #{@contents}"] 
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
        $stderr.puts "ERROR File Not Found #{absolute_filename}"
      end

    end

    def save
      ::File.open( absolute_filename, "w" ) do |f|
        f.write @contents
      end
    end

    def absolute_filename
      dir = ::File.join( @options[:path], @filename ) 
      dir = ::File.expand_path( dir )

      return dir
    end

    def module_name
        if @contents.match(/(^\s*module *)(.*)(;|\s*\()/i)
          return $2
        else
          return ""
        end
    end

    def instantiations
      inst = []
      @contents.scan(/(^\s*)(\w*)\s+\w+\s*(\([.,\(\)\w\s]*\))?;/mi){ inst << $2 }
      #Hack, module will also match the instatiation syntax, rempve via array subtraction
      inst = inst - ['module']

      return inst
    end

    def includes
      inc = []
      @contents.scan(/(^\s*`include [\'\"])(.*)([\'\"])/i){ inc << $2 }

      return inc
    end

  end #class File

end #modlue Verilog
