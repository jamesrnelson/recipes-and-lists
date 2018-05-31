# Defines Basket model
class Basket
  attr_reader :contents

  def initialize(initial_contents, user = nil)
    @contents = initial_contents || Hash.new(0)
    @current_user = user
  end

  def add_recipe(id)
    @contents[id.to_s] ||= 0
    @contents[id.to_s] += 1
  end

  def total_count
    @contents.values.sum
  end

  def find_recipe(id_string)
    Recipe.find(id_string.to_i)
  end

  def remove(id)
    @contents.delete(id)
  end

  def checkout(grocery_list_params)
    grocery_list = @current_user.grocery_lists.new(title: grocery_list_params[:title])
      if grocery_list.save
        @contents.each do |recipe, quantity|
          grocery_list.grocery_list_recipes.create(grocery_list_id: grocery_list.id, recipe_id: recipe.id)
        end
      else
        false
      end
    end
end
