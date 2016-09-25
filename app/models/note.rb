class Note < ApplicationRecord
  validates :title, presense: true
  validates :content, presense: true, length: {maximum: 140}
end
