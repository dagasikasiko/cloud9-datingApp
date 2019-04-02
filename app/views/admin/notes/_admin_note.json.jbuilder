json.extract! admin_note, :id, :title, :content, :user_id, :created_at, :updated_at
json.url admin_note_url(admin_note, format: :json)