class DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action do
    redirect_to root_path unless current_user && current_user.admin?
  end

  def index
  	@posts = Post.order('pub_date desc').limit(4)
    @questions = Question.order('created_at desc').limit(4)
    @prospects = Prospect.order('created_at desc').limit(5)
  end

  def questions
    @questions = Question.order('created_at desc').page(params[:page]).per(3)
  end

  def posts
  	@posts = Post.order('pub_date desc').page(params[:page]).per(3)
  end

  def newpost
    @posts = Post.all
  end

  def editpost
    @post = Post.friendly.find(params[:id])
  end

  def newquestion
  end

  def editquestion
    @question = Question.find(params[:id])
  end

  def prospects
    @prospects = Prospect.order('created_at desc')
  end


end
