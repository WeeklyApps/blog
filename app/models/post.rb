class Post < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user
  has_many :comments, as: :commentable

  self.per_page = 5
  
  def self.tag_cloud
    @tags = Post.tag_counts_on(:tags).limit(20).order('count desc').sort { |x, y| x.name <=> y.name }
  end
end
