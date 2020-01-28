$:.unshift File.expand_path("./lib", File.dirname(__FILE__))

require 'swagger-test-api'

puts "Hello there"

application = SwaggerTest::Root.new

puts "Got application"

startServer(application)

