
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module Verilog
  VERSION = '0.0.4'
end

require 'verilog/file'
require 'verilog/path'
