class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :notes
  has_many :userstamps
  has_many :stampimages, through: :userstamps
  
  
  has_many :frid, class_name: "frid", foreign_key: :userid, dependent: :destroy
  has_many :frid, class_name: "frid", foreign_key: :friendid, dependent: :destroy
  
  # self.primary_key = "email"
  
  mount_uploader :image, UserimageUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user/images/icon",'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
  
# ユーザー名による絞り込み
  scope :get_by_name, ->(name) {
  where("name like ?", "%#{name}%")
  }
  
end
