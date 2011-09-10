require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require './config/init'

#
# Before any route is run
before do
  @path = request.env['SCRIPT_NAME']
end

#
# Routes
match '/' do
  "Sinatra Template"
end