class Stampimage < ApplicationRecord
    mount_uploader :image, StampUploader
    has_many :userstamps
    has_many :users, through: :userstamps
end
