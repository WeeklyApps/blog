class Announcement < ActiveRecord::Base
  scope :active, where('end_date >= ?', Date.today)
  belongs_to :user
  has_many :comments, as: :commentable
  
  self.per_page = 15
  
end
