require 'sinatra/base'
require 'sinatra/assetpack'
require 'haml'
require 'sass'

assets do
  js :application, ['/js/*.js']
  css :application, ['/css/*.*']
end

get '/' do
  haml :index
end

get %r{/(.*)} do |file|
  halt 404, 'Not Found' and return unless File.exists? "./views/#{file}.haml"
  haml file.to_sym
end
