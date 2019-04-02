class Message < ApplicationRecord
    belongs_to :user, foreign_key: "userid"
    
    after_create_commit { MessageBroadcastJob.perform_later self }
end
