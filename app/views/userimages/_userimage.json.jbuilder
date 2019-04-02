json.extract! userimage, :id, :user_id, :created_at, :updated_at
json.url userimage_url(userimage, format: :json)