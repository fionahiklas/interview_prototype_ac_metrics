require 'sinatra/base'

require 'util/lumber'


module DeviceApi

  class Server < Sinatra::Base

    include Util::Lumber::LumberJack

    @@log = lumber("Server")

    def initialize()
      super
      @@log.debug("Created DeviceApi Server")
    end

  end

end

