class Project < ActiveRecord::Base
  self.per_page = 15
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :description, presence: true  

end
