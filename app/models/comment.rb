class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  
  validates :commenter, exclusion: { in: %w[Clint Robert thatrailsguy robmc] + User.all.map{|u| u.display_name}, message: "%{value} is reserved."}
  validates :content, presence: true

end
