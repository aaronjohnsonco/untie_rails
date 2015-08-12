class PostsController < ApplicationController

	autocomplete :tag, :name, :full => true

	def create
		@post = Post.create(post_params)
		if params[:publish]
			@post.status = "published"
			if @post.save
				redirect_to(dashboard_posts_path, flash: :success)
			else
				redirect_to(dashboard_posts_path, flass: :error)
			end
		elsif params[:draft]
			@post.status = "draft"
			if @@post.save
				redirect_to(dashboard_posts_path, flash: :success)
			else
				redirect_to(dashboard_posts_path, flash: :error)
			end
		end
	end

	def update
		@post = Post.friendly.find(params[:id])
		if params[:publish]
			@post.status = "published"
			if @post.update(post_params)
				redirect_to(dashboard_posts_path, flash: :success)
			else
				redirect_to(dashboard_posts_path, flass: :error)
			end
		elsif params[:draft]
			@post.status = "draft"
			if @post.update(post_params)
				redirect_to(dashboard_posts_path, flash: :success)
			else
				redirect_to(dashboard_posts_path, flass: :error)
			end
		end
	end

	def index

		if params[:search]
			@posts = Post.search(params[:search])
		else
			@posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').order('pub_date desc')
		end
		#@posts = Post.search(params[:search])
		#if @posts.class == Array
		#	@posts = Kaminari.paginate_array(@posts).page(params[:page]).per(4)
		#else
		#	@posts = @posts.page(params[:page]).per(4)
		#end


		if params[:tag]
			@posts = Post.tagged_with(params[:tag]).order('pub_date desc').where('status = ? AND pub_date <= ?', 'published', Date.today)
			@footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
		else
			@posts = Post.order('pub_date desc').where('status = ? AND pub_date <= ?', 'published', Date.today)
			@footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
		end
	end

	def show
		@post = Post.friendly.find(params[:id])
		@footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
	end

	def destroy
		@post = Post.friendly.find(params[:id])
		@post.destroy
		redirect_to dashboard_posts_path
	end

	private

		def post_params
			params.require(:post).permit(:title, :author, :pub_date, :favorite, :body, :status, :slug, :all_tags)
		end
end
