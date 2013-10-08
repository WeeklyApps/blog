class Project < ActiveRecord::Base
  self.per_page = 15
  has_many :comments, as: :commentable
end
