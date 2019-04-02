class Admin::Stampimage < ApplicationRecord
    mount_uploader :image, StampUploader
end
