# Defines Recipe Ingredient Model
class RecipeIngredient < ApplicationRecord
  validates :quantity, presence: true
  validates :measurement, presence: true

  belongs_to :recipe
  belongs_to :ingredient

  belongs_to :creator, :class_name => 'User'

  def formatted_quantity
    if quantity.split('.')[1].length == 1 && quantity.split('.')[1][0] == '0'
      "#{quantity.split('.')[0]}"
    elsif quantity.split('.')[0].to_i  > 0 && quantity.split('.')[1][0..1] == "33"
      "#{quantity.split('.')[0]} 1/3"
    elsif quantity.split('.')[0] .to_i == 0 && quantity.split('.')[1][0..1] == "33"
      "1/3"
    elsif quantity.split('.')[0].to_i  > 0 && quantity.split('.')[1][0..1] == "66"
      "#{quantity.split('.')[0]} 2/3"
    elsif quantity.split('.')[0] .to_i == 0 && quantity.split('.')[1][0..1] == "66"
      "2/3"
    elsif quantity.split('.')[0].to_i  > 0 && quantity.split('.')[1][0..1] == "25"
      "#{quantity.split('.')[0]} 1/4"
    elsif quantity.split('.')[0] .to_i == 0 && quantity.split('.')[1][0..1] == "25"
      "1/4"
    elsif quantity.split('.')[0].to_i  > 0 && quantity.split('.')[1][0] == "5"
      "#{quantity.split('.')[0]} 1/2"
    elsif quantity.split('.')[0] .to_i == 0 && quantity.split('.')[1][0] == "5"
      "1/2"
    elsif quantity.split('.')[0].to_i  > 0 && quantity.split('.')[1][0..1] == "75"
      "#{quantity.split('.')[0]} 3/4"
    elsif quantity.split('.')[0] .to_i == 0 && quantity.split('.')[1][0..1] == "75"
      "3/4"
    else
      quantity
    end
  end
end
