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

Examples
--------

    
TODO
----

