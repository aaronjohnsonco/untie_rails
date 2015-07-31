class PagesController < ApplicationController

  def home
    @footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
  end

  def about
    @footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
  end

  def faq
    @footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
    @question_open = Question.limit(1).where('status = ?', 'published')
    @questions_closed = Question.offset(1).where('status = ?', 'published')
	end

	def bio
    @footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
	end

	def basic
	end

end
