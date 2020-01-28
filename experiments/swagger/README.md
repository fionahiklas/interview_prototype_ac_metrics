# Swagger UI and Ruby Experiment

## Overview

Trying out swagger and swagger-ui with Ruby

## Running

### Check out the code

```
git clone https://github.com/fionahiklas/theorem_prototype_fiona.git
cd deviceApi
```

### Install Gems

Run the following

```
gem install bundler --user-install
export PATH=~/.gem/ruby/2.6.0/bin:$PATH

bundle install --path ~/.gem
```

### Start server

Run the following command to start the server

```
ruby startServer.rb
```

You can then access the status endpoint using the following curl command

```
curl http://localhost:9292/status
```

The swagger file should be available here 

```
curl http://localhost:9292/swagger_doc
```

### Using swagger-ui

Start swagger-ui in a docker container

```
docker run -p 8080:8080 swaggerapi/swagger-ui
```

Annoyingly you can only override the URL that the UI uses for swagger JSON with 
a file, there appears to be no way to provide a reference to a site.

In a browser open `http://localhost:8080`

In the field for the Swagger URL paste in `http://localhost:9292/swagger_doc`


## References

### Grape

* [Grape](https://github.com/ruby-grape/grape)
* [Grape swagger](https://github.com/ruby-grape/grape-swagger)
* [Swagger UI usage](https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/installation.md)
* [Swagger UI Docker](https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/configuration.md#docker)


### Old

Originally attempted to use Sinatra and swagger exposer but versioning was a problem and 
other errors occurred.  Seems that sinatra and the swagger support is out of date and 
not worth pursuing.

* [Sinatra swagger exposer gem](https://rubygems.org/gems/sinatra-swagger-exposer)
* [Sinatra swagger exposer github](https://github.com/archiloque/sinatra-swagger-exposer)
* [Sinatra cross origin github](https://github.com/britg/sinatra-cross_origin)
* [Cross origin example](https://github.com/archiloque/sinatra-swagger-exposer/tree/master/example)




