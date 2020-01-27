$:.unshift File.expand_path("./lib", File.dirname(__FILE__))

require 'swagger-test-api'

run app: SwaggerTest::Server.new



