class Post < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user

  self.per_page = 5
  
end
