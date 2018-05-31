# Defines User Grocery List Controller Actions
class UserGroceryListsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @grocery_list = GroceryList.new
  end
end
