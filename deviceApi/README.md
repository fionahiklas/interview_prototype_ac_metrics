# Device API Application 

## Overview



## Configuration


### RACK_ENV

This is a standard variable used to communicate the environment in which a RACK application is running.  The values this variable can take the following values

* development
* test
* production

For normal development work locally the value of this variable is obviously "development".  When running tests however it has been set to "test" in the Rakefile to force that configuration.

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

### Ruby

* [Sinatra and Event Machine](http://recipes.sinatrarb.com/p/embed/event-machine?)
