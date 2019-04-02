class Userstamp < ApplicationRecord
    belongs_to :user
    belongs_to :stampimage
end
