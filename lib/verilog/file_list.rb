module Verilog

  class FileList
    attr_reader :files

    ## Expected usage
    # Use FileList to create an array of files included in design
    # FileList is then used to create a Path, which loads the files into memory
    # FileList and Path are separated in case you want a file list with out actually having to open the files
    def initialize( a_filelist='' )
      @files = []
      unless ( a_filelist == '')
        parse_list!( a_filelist )
      end
    end

    ## Unsure of the name for this
    # open : it does open the file but not like other open calls
    # load : opens file and loads content, load! does not imply what it modifies
    # parse_list is descriptive but not what it modifies

    def parse_list( filelist )
      temp_files = []
      ## Splat (*) filelist into Array if single string
      [*filelist].each do |item|
        abort( "FileList parse_list item not found : #{item}") unless ::File.exist?( item )
        ::IO.readlines( item ).each do |line|
          ## Remove // or # comments 
          line = strip_comments( line )

          ## Expand Environment variables in strings
          line = expand_envvars( line )
          
          ## -incdir, include the entire contents of listed directory
          if line.match(/^\s*-incdir\s+(\S+)\s*/)
            temp_files << incdir($1)

          ## Recurse on -f (file.f including other files.f)
          elsif line.match(/^\s*-f\s+(\S+)\s*/)
            temp_files << parse_list($1)

          ## Ignore Whitespace
          elsif line.match(/^\s$/)
            next
         
          ## Append file list line to list of files
          else
            temp_files << line.strip
          end
        end
      end

      ## Recursion embeds arrays, return flat file list

      return temp_files.flatten
    end

    def parse_list!( filelist )
      files.push( *parse_list( filelist ) )
    end
      
    def to_path
      new_path = Path.new

      self.files.each do |f|
        new_path.load_file( f )
      end

      return new_path
    end

    private


    def incdir( in_string )
      ## returns array of files and links
      inc_list = []
      
      Dir.glob( ::File.join(in_string, '*') ).select do |item|
        if ::File.file?( item ) or ::File.symlink?( item )
          inc_list << item
        end
      end

      return inc_list
    end

    def expand_envvars( in_string )
      return in_string.gsub(/\$(\w+)/) { ENV[$1] }
    end

    def strip_comments( in_string )
      return in_string.gsub(/(\/\/|#).*$/, '')
    end

  end

end

