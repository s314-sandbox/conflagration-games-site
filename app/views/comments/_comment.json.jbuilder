json.call(comment, :id, :created_at, :updated_at, :contents)
json.author comment.user.email