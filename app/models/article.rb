class Article < ActiveRecord::Base
  belongs_to :user
  has_many   :comments

  has_attached_file :thumbnail,
                      styles:  { medium: "600x400#", thumb: "150x100#" }
  validates_attachment_content_type :thumbnail,
                      content_type: ["image/jpg","image/jpeg","image/png"]
end
