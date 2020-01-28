$:.unshift File.expand_path("./lib", File.dirname(__FILE__))

require 'thin'
require 'device-api'


def startServer(application)
  Thin::Server.start('0.0.0.0', 9292) do
    run application
  end
end


application = ACDeviceSystem::Root.new

startServer(application)

