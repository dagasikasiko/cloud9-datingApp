class Frids < ApplicationRecord
    
    belongs_to :User, class_name: "USer", foreign_key: :id
    
    self.primary_key = :userid, :friendid
    
    # ユーザー名の友達検索
    scope :get_by_name, ->(name) {
    where("name like ?", "%#{name}%")
    }
    
    # mailの検索
    scope :get_by_email, ->(email) {
    where("email like ?", "%#{email}%")
    }
end
