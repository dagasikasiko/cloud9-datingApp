class Userimage < ApplicationRecord
    mount_uploader :image, UserimageUploader
end
