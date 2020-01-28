require 'grape'
require 'grape-swagger'
require 'rack/cors'

require 'util/lumber'


module SwaggerTest

  class Server < Grape::API

    include Util::Lumber::LumberJack

    @@log = lumber("Server")
    @@log.debug("Hello world!")

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

    # Some of the docs say this is necessary.  Difficult to test locally
    # seems to work without it.
    # use Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '/swagger_doc', headers: :any, methods: [ :get, :options ]
    #   end
    # end

    format :json
    mount Server
    add_swagger_documentation
  end

end
