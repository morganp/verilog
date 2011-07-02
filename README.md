Verilog
=======

Install
-------

    gem install verilog

Usage
-----

    require 'verilog'
    test_one = Verilog::File.new("test_one.v", {:path => '..' })
    test_one.read_from_disk

    puts test_one.contents

    test_one.contents = %{New Content}
    test_one.save

Some more advanced uses include finding what modules are instatiated or included.

    require 'verilog'
    test_one = Verilog::File.new("test_one.v", {:path => '..' })
    test_one.read_from_disk
    
    puts test_one.module_name
    puts test_one.instantiations
    puts test_one.includes

Examples
--------

    
TODO
----

