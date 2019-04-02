class Friend < ApplicationRecord
    # ユーザー名による絞込み
    scope :get_by_name, ->(name) {
        where("testname like ?", "%#{name}%")
    }
end
