require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require './config/init'

#
# Before any route is run
before do
  @path = request.env['SCRIPT_NAME']
end

helpers do
  def get_place(id)
    f = Places.new("AIzaSyBwASSYWrGlEynSjAbD8l7izn5kz81lO9Q")
    f.get(id)
  end
end
  

#
# Routes
match '/' do
  @bartenders = Bartender.all
  erb :home
end

get '/bartender/add/?' do
  erb :add
end

get '/bartender/edit/:id/?' do
  @b = Bartender.find_by_id(params[:id])
  erb :edit
end

post '/bartender/add/?' do
  id = params[:id]
  if Bartender.find_by_id(id).nil?
    b = Bartender.new
    b.name = params[:name]
    b.creator = params[:creator]
    b.locations.push(params[:locations])
    b.save
    "added!"
  else
    "already exists"
  end
end

post '/bartender/edit/:id/?' do
  id = params[:id]
  b = Bartender.find_by_id(id)
  if b
    b.set(:name => params[:name], :creator => params[:creator], :status => params[:status], :locations => params[:locations])
  else
    "doesn't exist"
  end
end

post '/bartender/delete/:id/?' do
  id = params[:id]
  b = Bartender.find_by_id(id)
  if b
    b.destroy
  else
    "doesn't exist"
  end
end