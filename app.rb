require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('./lib/artist')
also_reload('lib/**/*.rb')
