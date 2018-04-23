# Defines Recipe model
class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :instructions, presence: true
  has_attached_file :image, default_url: 'spilled_milk.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
