# Defines Recipe model
class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :instructions, presence: true
  validates :photo, presence: true
end
