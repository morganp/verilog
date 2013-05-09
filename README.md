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

Some more advanced uses include finding what modules are instantiated or included.

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

* Add port commands 
     
     puts test_one.inputs
     puts test_one.outputs
     puts test_one.inouts

* Add function and task commands     

     puts test_one.functions
     puts test_one.tasks

LICENSE
-------

    Copyright (c) 2011, Morgan Prior
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
        * Redistributions of source code must retain the above copyright
          notice, this list of conditions and the following disclaimer.
        * Redistributions in binary form must reproduce the above copyright
          notice, this list of conditions and the following disclaimer in the
          documentation and/or other materials provided with the distribution.
        * Neither the name of the organization nor the
          names of its contributors may be used to endorse or promote products
          derived from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
    DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
