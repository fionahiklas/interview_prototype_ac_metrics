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

### Start using rack

Run the following command to start the server

```
rackup
```

You can then access the status endpoint using the following curl command

```
curl http://localhost:9292/status
```


## References

* [Sinatra swagger exposer gem](https://rubygems.org/gems/sinatra-swagger-exposer)
* [Sinatra swagger exposer github](https://github.com/archiloque/sinatra-swagger-exposer)
* [Sinatra cross origin github](https://github.com/britg/sinatra-cross_origin)
* [Cross origin example](https://github.com/archiloque/sinatra-swagger-exposer/tree/master/example)
* [Swagger UI usage](https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/installation.md)
* [Swagger UI Docker](https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/configuration.md#docker)




