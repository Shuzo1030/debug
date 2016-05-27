require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/' do
  @post = Post.order(updated_at: :desc)
  
  erb :index
end

get '/posts' do
  Post.create(title: params[:title], content: params[:body])
end

post '/posts/:id/comment' do
  post = Post.find(params[:id])
  post.comments.create(body: params[:comment])
  
  redirect '/'
end