class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		binding.pry 
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
		binding.pry
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	private

	def post_params(*args)
	  params.require(:post).permit(*args)
	end

	def edit
		binding.pry
	  @post = Post.find(params[:id])
	end
end
