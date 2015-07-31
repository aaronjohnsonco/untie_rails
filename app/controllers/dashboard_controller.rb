class DashboardController < ApplicationController
  def index
  	@posts = Post.order('pub_date desc')
    @questions = Question.all
  end

  def questions
    @questions = Question.all
  end

  def posts
  	@posts = Post.order('pub_date desc')
  end

  def newpost
  end

  def newquestion
  end
end
