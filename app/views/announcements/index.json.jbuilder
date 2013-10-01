json.array!(@announcements) do |announcement|
  json.extract! announcement, :body, :end_date, :user_id
  json.url announcement_url(announcement, format: :json)
end
