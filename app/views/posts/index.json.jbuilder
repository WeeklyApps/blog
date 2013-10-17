json.array!(@posts) do |post|
  json.extract! post, :title, :body, :tags, :created_at, :updated_at
	json.username post.user.display_name
  json.url post_url(post, format: :json)
end
