class GroceryListIngredientPresenter
  attr_reader :user_id, :grocery_list, :title, :date, :id

  def initialize(user_id, grocery_list_id)
    @user         = User.find(user_id)
    @grocery_list = @user.grocery_lists.find(grocery_list_id)
    @title        = @grocery_list.title
    @date         = @grocery_list.date
    @id           = @grocery_list.id
  end

  def ingredients
    @grocery_list.all_ingredients
  end

  def recipes
    @grocery_list.recipes
  end

  def format_quantity(quantity)
    if quantity.split('.')[1].nil?
      quantity
    elsif quantity.split('.')[1].length == 1 && quantity.split('.')[1][0] == '0'
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
