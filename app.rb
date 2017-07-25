require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'

get '/pokemons/new' do
  erb :"pokemons/new"
end

post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb(:"pokemons/edit")
end

delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("/pokemons")
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:instructor])
  redirect("/pokemons/#{@pokemon.id}")
end

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end
