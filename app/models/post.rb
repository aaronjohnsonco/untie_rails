class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :taggings
  has_many :tags, through: :taggings

  def all_tags=(names)
  	self.tags = names.split(",").map do |name|
  		Tag.where(name: name.strip).first_or_create!
  	end
  end

  def all_tags
  	self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
  	Tag.find_by_name!(name).posts
  end

  def self.tag_counts
  	Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end

  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
  end


end


#def self.search(search)
#    if search
#      find(:all, conditions: ['title || body LIKE ?', "%#{search}%"], conditions: ['status = ? AND published_on <= ?', "Published", Date.today], order: "published_on DESC")
#    else
#      find(:all, conditions: ['status = ? AND published_on <= ?', "Published", Date.today], order: "published_on DESC")
#    end
#  end