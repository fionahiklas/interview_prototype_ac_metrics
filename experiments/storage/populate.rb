

require 'bundler/setup'
require 'rrd'


database = ARGV[0]
starttime = ARGV[1].to_i

puts "Using database: " + database
puts "Using starttime: " + starttime.to_s

rrd = RRD::Base.new(database)

(1..365).each do |day|
  (0..23).each do |hour|
    (0..59).each do |minute|
      timestamp = starttime + (day * 1440) + (hour * 60) + minute

      result = rrd.update! timestamp, rand(60), rand(100), rand(100)
      puts("Timestamp: " + timestamp.to_s + " result: " + result.to_s)
    end
  end
end