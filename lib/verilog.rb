
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module Verilog
  VERSION = '0.1.1'
end

require 'verilog/file_list'
require 'verilog/file'
require 'verilog/path'
