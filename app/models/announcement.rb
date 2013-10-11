class Announcement < ActiveRecord::Base
  scope :active, where('end_date >= ?', Date.today)
  belongs_to :user
  has_many :comments, as: :commentable
  before_save :format_date
  
  self.per_page = 15

  def format_date
    self.end_date = self.end_date.strftime('%m/%d/%Y')
  end
  
end
