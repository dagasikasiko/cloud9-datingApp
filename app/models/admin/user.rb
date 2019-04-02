class Admin::User < ApplicationRecord
    devise :database_authenticatable, :registerable, :validatable
  has_many :notes
end
