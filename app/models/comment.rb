class Comment < ActiveRecord::Base
  # attr_accessible :content, :commenter
  belongs_to :commentable, polymorphic: true
end
