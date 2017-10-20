### FB64 - Fast Base64

FB64 is a C extension that can encode and decode base64. It leverages the [Base64](https://github.com/aklomp/base64) library.

#### Installation
1) Download and compile [Base64](https://github.com/aklomp/base64)
2) Copy the library and headers to the appropriate directories,
   such as /usr/local/lib and /usr/local/include on OSX.
3) `gem install fb64`

#### Sample Usage
```ruby
require "fb64"
encoded = FB64.encode64("Sample String")
puts encoded
=> "U2FtcGxlIFN0cmluZw=="

FB64.decode64(encoded)
=> "Sample String"
```

#### Benchmarks
Run from 2.2Ghz Intel Core i7:

```
Calculating -------------------------------------
FB64 encode large string
                        279.814  (± 7.5%) i/s -      8.372k in  30.097192s
Base64 encode large string
                        146.939  (± 3.4%) i/s -      4.410k in  30.043984s

Comparison:
FB64 encode large string:      279.8 i/s
Base64 encode large string:      146.9 i/s - 1.90x  slower

Calculating -------------------------------------
FB64 decode large string
                        213.429  (± 4.7%) i/s -      6.400k in  30.052835s
Base64 decode large string
                        110.270  (± 2.7%) i/s -      3.311k in  30.051945s

Comparison:
FB64 decode large string:      213.4 i/s
Base64 decode large string:      110.3 i/s - 1.94x  slower

Calculating -------------------------------------
FB64 encode small string
                          2.195M (± 3.3%) i/s -     65.770M in  29.999757s
Base64 encode small string
                          1.249M (± 6.1%) i/s -     37.348M in  30.025452s

Comparison:
FB64 encode small string:  2194957.8 i/s
Base64 encode small string:  1249343.9 i/s - 1.76x  slower

Calculating -------------------------------------
FB64 decode small string
                          1.957M (± 8.3%) i/s -     58.318M in  30.049957s
Base64 decode small string
                          1.165M (± 4.8%) i/s -     34.910M in  30.036906s

Comparison:
FB64 decode small string:  1956556.9 i/s
Base64 decode small string:  1165117.6 i/s - 1.68x  slower
```
Run `rake benchmark` after compiling to benchmark your own setup.

#### Local development
1) `bundle exec rake test -- --with-libbase64-dir=/path/to/libbase64`
