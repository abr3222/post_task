require 'sinatra'

%w[config models controller serializers].each do |dir|
  $LOAD_PATH << File.expand_path('.', File.join(File.dirname(__FILE__), dir))
  require File.join(File.dirname(__FILE__), dir, 'manifest')
end




