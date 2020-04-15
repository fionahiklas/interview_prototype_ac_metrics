# Storage experiment

## Overview

Need to store time-series data and be able to write this from the ruby 
application and read it from the node.js frontend.

## RRDtool

### Installing rrdtool

I tried compiling this myself but it has *alot* of dependencies and it was
getting somewhat out of hand.

Using homebrew instead.


### Creating a database

``` 
rrdtool create ACUnit.rrd --start 1548677820 --step 60 \
DS:temp:GAUGE:120:-20:60 \
DS:humidity:GAUGE:120:0:100 \
DS:mono:GAUGE:120:0:100 \
RRA:LAST:0.5:1:525600 \
RRA:AVERAGE:0.5:60:8760 \
RRA:MIN:0.5:60:8760 \
RRA:MAX:0.5:60:8760 \
RRA:AVERAGE:0.5:1440:365 \
RRA:MIN:0.5:1440:365 \
RRA:MAX:0.5:1440:365 
```

The `120` value for each data source is important, when this was set to `60` 
no data was registered as the timestamps were 60seconds apart anyway.  This needs
some more tweaking.

The start time represents 2019/01/28 @ 12:17pm (UTC) which is just over a year
ago at time of writing.

### Populate the database

There is a Ruby script that can be used to populate the data 

``` 
ruby populate.rb ACUnit.rrd 1548677820
```

This should write a whole years worth of data


### Fetch data

``` 
rrdtool fetch ACUnit.rrd LAST -s 1549118460 -e 1549204860 | less
```

The start point is 2019-02-02T14:41:00+00:00
The end point is 2019-02-03T14:41:00+00:00


### Create a graph

The start point is 2019-01-28T12:17:00+00:00
The end point is 2020-01-29T12:16:01+00:00

```
rrdtool graph ACUnit.png -a PNG -w 1000 -h 500 --slope-mode \
-s 1548677820 -e 1580300161 -S  \
DEF:temp=ACUnit.rrd:temp:LAST \
DEF:humidity=ACUnit.rrd:humidity:LAST \
DEF:mono=ACUnit.rrd:mono:LAST \
LINE1:temp#0000ff:temp \
LINE2:humidity#00ff00:humidity \
LINE3:mono#ff0000:mono
```



## References

* [rrdtool](https://oss.oetiker.ch/rrdtool/)
* [Ruby rrd-ffi](https://rubygems.org/gems/rrd-ffi/versions/0.2.14)
* [bundler](https://bundler.io/v2.0/guides/bundler_setup.html)
* [rrd-ffi github](https://github.com/morellon/rrd-ffi/blob/master/lib/rrd/wrapper.rb)
* [rrd tutorial](https://oss.oetiker.ch/rrdtool/tut/rrdtutorial.en.html)
* [graph sensors with RRDTool](https://michael.bouvy.net/blog/en/2013/04/28/graph-data-rrdtool-sensors-arduino/)
* [UNIX standard time](https://www.unixtimestamp.com/index.php)
* [rrdfetch](https://oss.oetiker.ch/rrdtool/doc/rrdfetch.en.html)
* [rrdgraph examples](https://oss.oetiker.ch/rrdtool/doc/rrdgraph_examples.en.html)




