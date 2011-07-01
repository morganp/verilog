
NAME="verilog"

Dir.chdir( './lib/')
puts require NAME
Dir.chdir( './../')

spec = Gem::Specification.new do |s|
   s.name         = NAME
   s.version      = Verilog::VERSION
   s.platform     = Gem::Platform::RUBY
   s.summary      = 'Helpers for working with verilog files'
   s.homepage     = "http://amaras-tech.co.uk/software/#{NAME}"
   s.authors      = "Morgan Prior"
   s.email        = "#{NAME}_gem@amaras-tech.co.uk"
   s.description  = %{File helpers with specific functions for Verilog HDL}
   s.files        = [Dir.glob("LICENSE.rtf")]
   s.files        += Dir.glob("README.md")
   s.files        += Dir.glob("HISTORY.md")
   s.files        += Dir.glob("Rakefile")
   s.files        += Dir.glob("examples/*")
   s.files        += Dir.glob("lib/**/*")
   s.files        += Dir.glob("spec/*")
   s.has_rdoc     = false

end

