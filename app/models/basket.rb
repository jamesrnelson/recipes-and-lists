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
end