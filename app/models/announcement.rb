class Announcement < ActiveRecord::Base
  scope :active, where('end_date >= ?', Date.today)
  belongs_to :user
  has_many :comments, as: :commentable

  validates :body, presence: true
  validates :end_date, presence: true
  
  self.per_page = 15
  
end
