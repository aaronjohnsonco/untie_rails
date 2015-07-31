class PostsController < ApplicationController

	def create
		@post = Post.create(post_params)
		if params[:publish]
			@post.status = "published"
			@post.save
			redirect_to dashboard_posts_path
		elsif params[:draft]
			@post.status = "draft"
			@post.save
			redirect_to dashboard_posts_path
		else
			redirect_to dashboard_path
		end
	end

	def index
		@posts = Post.order('pub_date desc').where('status = ? AND pub_date <= ?', 'published', Date.today)
		@footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
	end

	def show
		@post = Post.friendly.find(params[:id])
		@footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
	end

	private

		def post_params
			params.require(:post).permit(:title, :author, :pub_date, :favorite, :body, :status, :slug)
		end
end
