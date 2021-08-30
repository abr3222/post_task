# require 'sinatra'

%w[config models controller serializers].each do |dir|
  $LOAD_PATH << File.expand_path('.', File.join(File.dirname(__FILE__), dir))
  require File.join(File.dirname(__FILE__), dir, 'manifest')
end

class API < Sinatra::Base
  use OpenAPI  # put OpenAPI first or a `denied` will happen.
  use AuthedAPI

  set :bind, '0.0.0.0'
  set :port, 8080

  # start the server if ruby file executed directly
  run! if app_file == $0
end




