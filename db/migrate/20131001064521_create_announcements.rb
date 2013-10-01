class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :body
      t.date :end_date
      t.integer :user_id

      t.timestamps
    end
  end
end
