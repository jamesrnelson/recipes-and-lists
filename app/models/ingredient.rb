# Defines Ingredient model
class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :measurement, presence: true
end
