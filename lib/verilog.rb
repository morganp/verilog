
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module Verilog
  VERSION = '0.0.3'
end

require 'verilog/file'
