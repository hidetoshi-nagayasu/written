class User < ActiveRecord::Base
  validates :user_name, presence: true  # 値が存在すれば検証成功
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments

  has_attached_file :avatar,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar,
                      content_type: ["image/jpg","image/jpeg","image/png"]
end
