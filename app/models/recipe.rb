# Defines Recipe model
class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :instructions, presence: true
  has_attached_file :image, default_url: 'spilled_milk.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :creator, :class_name => 'User'
end
