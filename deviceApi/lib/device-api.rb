require 'grape'
require 'grape-swagger'
require 'rack/cors'

require 'util/lumber'



module ACDeviceSystem

  class DeviceApi < Grape::API

    include Util::Lumber::LumberJack

    @@log = lumber("Server")

    format :json

    get :status do
      @@log.debug("/status called")

      { status: 'OK' }
    end

    post :register do
      @@log.debug("/register called")

    end

    post :authenticate do
      @@log.debug("/authenticate called")

    end

    put :data do
      @@log.debug("/data called")

    end
  end


  class Root < Grape::API

    # Some of the docs say this is necessary.  Difficult to test locally
    # seems to work without it.
    # use Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '/swagger_doc', headers: :any, methods: [ :get, :options ]
    #   end
    # end

    format :json
    mount DeviceApi
    add_swagger_documentation
  end
end

