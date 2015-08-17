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
    @footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
	end

  def property
    @footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
  end

  def children
    @footer_posts = Post.where('pub_date <= ? AND status = ?', Date.today, 'published').limit(4)
  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/documents/Divorce_Packet.pdf",
      filename: "Divorce_Packet",
      type: "application/pdf"
    )
  end

  def download_parenting_class_pdf
    send_file(
      "#{Rails.root}/public/documents/Parenting_Class.pdf",
      filename: "Parenting_Class",
      type: "application/pdf"
    )
  end




end
