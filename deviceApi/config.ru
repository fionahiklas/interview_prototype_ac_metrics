$:.unshift File.expand_path("./lib", File.dirname(__FILE__))

require 'device-api'

run app: DeviceApi::Server.new



