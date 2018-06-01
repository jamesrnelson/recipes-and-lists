user = User.create(username: 'Default', email: 'default@email.com', password: 'password')

ingredients = [
  ['Garlic', 'Produce'],
  ['Lemon', 'Produce'],
  ['Lime', 'Produce'],
  ['Apple', 'Produce'],
  ['Butternut Squash', 'Produce'],
  ['Spinach', 'Produce'],
  ['Romaine Lettuce', 'Produce'],
  ['Rutabaga', 'Produce'],
  ['Carrots', 'Produce'],
  ['Cilantro', 'Produce'],
  ['Raspberries', 'Produce'],
  ['Blueberries', 'Produce'],
  ['Blackberries', 'Produce'],
  ['Parsley, fresh', 'Produce'],
  ['Basil, fresh', 'Produce'],
  ['Mint, fresh', 'Produce'],
  ['Tomatoes', 'Produce'],
  ['Potatoes', 'Produce'],
  ['Sweet Potatoes', 'Produce'],
  ['Yellow Onion', 'Produce'],
  ['Red Onion', 'Produce'],
  ['Green Onion', 'Produce'],
  ['Bell Pepper', 'Produce'],
  ['Bananas', 'Produce'],
  ['Grapes', 'Produce'],
  ['Stawberries', 'Produce'],
  ['Oranges', 'Produce'],
  ['Watermelon', 'Produce'],
  ['Peaches', 'Produce'],
  ['Cantaloupe', 'Produce'],
  ['Avocados', 'Produce'],
  ['Pineapple', 'Produce'],
  ['Cherries', 'Produce'],
  ['Pears', 'Produce'],
  ['Raspberries', 'Produce'],
  ['Plums', 'Produce'],
  ['Nectarines', 'Produce'],
  ['Grapefruit', 'Produce'],
  ['Carrots', 'Produce'],
  ['Lettuce', 'Produce'],
  ['Broccoli', 'Produce'],
  ['Salad Mix', 'Produce'],
  ['Celery', 'Produce'],
  ['Cucumbers', 'Produce'],
  ['Corn', 'Produce'],
  ['Mushroom', 'Produce'],
  ['Cabbage', 'Produce'],
  ['Eggplant', 'Produce'],
  ['Green Beans', 'Produce'],
  ['Cauliflower', 'Produce'],
  ['Asparagus', 'Produce'],
  ['Rutabaga', 'Produce'],
  ['Eggs', 'Dairy and Eggs'],
  ['Milk', 'Dairy and Eggs'],
  ['Sour Cream', 'Dairy and Eggs'],
  ['Cheddar Cheese', 'Dairy and Eggs'],
  ['Swiss Cheese', 'Dairy and Eggs'],
  ['Provolone Cheese', 'Dairy and Eggs'],
  ['Mozzarella Cheese', 'Dairy and Eggs'],
  ['Colby Cheese', 'Dairy and Eggs'],
  ['Pepper Jack Cheese', 'Dairy and Eggs'],
  ['Chicken Legs', 'Meat and Poultry'],
  ['Chicken breast', 'Meat and Poultry'],
  ['Chicken thighs', 'Meat and Poultry'],
  ['Whole Chicken', 'Meat and Poultry'],
  ['Chicken wings', 'Meat and Poultry'],
  ['Steak', 'Meat and Poultry'],
  ['Pork Chops', 'Meat and Poultry']
]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient[0], category: ingredient[1])
end

recipe_titles = [
  'Banh Mi Pork Salad',
  'Spicy Tuna Rolls',
  'Warm Salmon and Potato Salad',
  'Thai Chicken and Brussels Sprouts Skillet',
  'Veggie Hash with Eggs',
  'Roasted Chicken Thighs with Vegetables and Apples',
  'Green Chile Pork Stew',
  'Veggie Noodle Soup with Basil Pesto',
  'Apple Butternut Squash Soup',
  'Chicken Adobo with Mashed Sweet Potatoes'
]

recipe_titles.each do |title|
  user.recipes.create(title: title, prep_time: rand(5..60), cook_time: rand(5..60), instructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
end

recipes = Recipe.all
ingredients = Ingredient.all
measurements = ['count', 'cloves', 'tsp', 'tbsp', 'oz', 'lbs', 'oz', 'cup', 'other']

recipes.each do |recipe|
  7.times do
    recipe.recipe_ingredients.create(
      ingredient_id: ingredients.sample.id,
      measurement: measurements.sample,
      quantity: rand(1..10),
      creator_id: user.id
    )
  end
end
