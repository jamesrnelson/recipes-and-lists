# Defines Recipe model
class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :instructions, presence: true
  has_attached_file :photo, default_url: "spilled_milk.png"
  validates_attachment_content_type :photo, content_type: /\Aphoto\/.*\z/
end
