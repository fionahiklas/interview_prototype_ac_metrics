# Device API Application 

## Overview


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
ruby startServer.rb
```

You can then access the status endpoint using the following curl command

```
curl http://localhost:9292/status
```


## References

### Ruby

* [Grape](https://github.com/ruby-grape/grape)
* [Grape swagger](https://github.com/ruby-grape/grape-swagger)
* [Swagger UI usage](https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/installation.md)
* [Swagger UI Docker](https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/configuration.md#docker)



