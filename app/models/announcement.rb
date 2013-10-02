class Announcement < ActiveRecord::Base
  scope :active, where('end_date >= ?', Date.today)
  belongs_to :user
end
