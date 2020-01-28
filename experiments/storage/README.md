# Storage experiment

## Overview

Need to store time-series data and be able to write this from the ruby 
application and read it from the node.js frontend.


## Installing rrdtool

I tried compiling this myself but it has *alot* of dependencies and it was
getting somewhat out of hand.

Using homebrew instead.


## Creating a database

``` 
rrdtool create ACUnit.rrd --start 1548677820 --step 60 \
DS:temp:GAUGE:120:-20:60 \
DS:humidity:GAUGE:120:0:100 \
DS:mono:GAUGE:120:0:100 \
RRA:LAST:0.5:1:1440 \
RRA:AVERAGE:0.5:7:1440 \
RRA:AVERAGE:0.5:210:1440 \
RRA:AVERAGE:0.5:2520:1440
```

Fetch data

``` 
rrdtool fetch ACUnit.rrd LAST -s 1549204000 -r 60s | less
```


Create a graph

``` 
rrdtool graph ACUnit.png -a PNG -w 1000 -h 500 --slope-mode -s 1549204000 -e 1549204860 -S 60s DEF:temp=ACUnit.rrd:temp:LAST DEF:humidity=ACUnit.rrd:humidity:LAST DEF:mono=ACUnit.rrd:mono:LAST LINE1:temp\#ff0000 LINE2:humidity:\#000000 LINE3:mono:\#0000ff
```


## References

* [rrdtool](https://oss.oetiker.ch/rrdtool/)
* [Ruby rrd-ffi](https://rubygems.org/gems/rrd-ffi/versions/0.2.14)
* [bundler](https://bundler.io/v2.0/guides/bundler_setup.html)


