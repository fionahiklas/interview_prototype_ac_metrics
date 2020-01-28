require 'eventmachine'
require 'thin'
require 'grape'
require 'grape-swagger'

require 'util/lumber'


module SwaggerTest

  class Server < Grape::API

    include Util::Lumber::LumberJack

    @@log = lumber("Server")
    @@log.debug("Hello world!")

    def initialize
      @@log.debug("Created DeviceApi Server")
    end

    format :json

    get :status do
      @@log.debug("/status called")
      EM.next_tick do
        @@log.debug("Next tick called")
      end

      { status: 'OK' }
    end

  end

  class Root < Grape::API
    format :json
    mount Server
    add_swagger_documentation
  end

end


# def startServer(application)
#   EM.run do
#
#     Signal.trap("INT")  { EventMachine.stop }
#     Signal.trap("TERM") { EventMachine.stop }
#
#     # dispatch = Rack::Builder.app do
#     #   map '/' do
#     #     run application
#     #   end
#     # end
#
#     Rack::Server.start({
#         app: application,
#         server: 'thin',
#         Host: '0.0.0.0',
#         Port: 9292,
#         signals: true  })
#   end
# end

def startServer(application)
  Thin::Server.start('0.0.0.0', 9292) do
    run application
  end
end