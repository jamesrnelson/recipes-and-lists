require 'rails_helper'

describe OutsideRecipe do

  let(:attrs) {
    { "sourceUrl": "http://www.vegetariantimes.com/recipe/spicy-fall-stew-baked-in-a-pumpkin/",
      "sourceName": "Vegetarian Times",
      "id": 759372,
      "title": "Spicy Fall Stew Baked in a Pumpkin",
      "readyInMinutes": 45,
      "servings": 6,
      "image": "https://spoonacular.com/recipeImages/759372-556x370.jpg",
      "instructions": "1. Preheat oven to 350°F. Heat 1 Tbs. oil in pot over medium heat. Add onion, bell pepper, and garlic. Sauté 7 minutes, or until softened. Stir in chili powder, cumin, and oregano, and cook 3 minutes more, or until spices darken.2. Add tomatillos, hominy, 1/2 cup water, and salt. Cover, and bring to a boil. Reduce heat to medium-low, and simmer, partially covered, 10 to 12 minutes, or until tomatillos are softened. Uncover, and cook 5 minutes more to thicken stew, if necessary.3. Meanwhile, cut top of pumpkin around stem to make lid. Scoop out pumpkin seeds and strings. Rub inside of pumpkin with remaining 1 Tbs. oil, and sprinkle generously with salt. Sprinkle cheese in bottom of pumpkin.4. Fill pumpkin with stew, then top with pumpkin lid. Place on parchment-covered baking sheet and bake 1 1/2 to 2 hours, or until pumpkin flesh is fork-tender. Remove from oven; let stand 5 minutes.5. Scoop stew, including pumpkin, into bowls and serve hot, topped with Poblano-Cucumber Salsa (Click here for recipe). ",
      "extendedIngredients": [
        {
            "id": 10011643,
            "aisle": "Produce",
            "image": "buttercup-squash.jpg",
            "consitency": "solid",
            "name": "buttercup squash",
            "original": "1 3- to 4-lb. pumpkin, either sugar pie, cheese, red kuri, kabocha, or buttercup squash",
            "originalString": "1 3- to 4-lb. pumpkin, either sugar pie, cheese, red kuri, kabocha, or buttercup squash",
            "amount": 3,
            "unit": "lb",
            "meta": [
                "red"
            ],
            "metaInformation": [
                "red"
            ],
            "measures": {
                "us": {
                    "amount": 3,
                    "unitShort": "lb",
                    "unitLong": "pounds"
                },
                "metric": {
                    "amount": 1.361,
                    "unitShort": "kilogram",
                    "unitLong": "kilograms"
                }
            }
        },
        {
            "id": 2009,
            "aisle": "Spices and Seasonings",
            "image": "chili-powder.jpg",
            "consitency": "solid",
            "name": "chili powder",
            "original": "1 tsp. chili powder, preferably New Mexican",
            "originalString": "1 tsp. chili powder, preferably New Mexican",
            "amount": 1,
            "unit": "tsp",
            "meta": [],
            "metaInformation": [],
            "measures": {
                "us": {
                    "amount": 1,
                    "unitShort": "tsp",
                    "unitLong": "teaspoon"
                },
                "metric": {
                    "amount": 1,
                    "unitShort": "tsp",
                    "unitLong": "teaspoon"
                }
            }
        },
        {
            "id": 11215,
            "aisle": "Produce",
            "image": "garlic-roasted.jpg",
            "consitency": "solid",
            "name": "garlic",
            "original": "2 cloves garlic, minced (2 tsp.)",
            "originalString": "2 cloves garlic, minced (2 tsp.)",
            "amount": 2,
            "unit": "tsp",
            "meta": [
                "minced"
            ],
            "metaInformation": [
                "minced"
            ],
            "measures": {
                "us": {
                    "amount": 2,
                    "unitShort": "tsps",
                    "unitLong": "teaspoons"
                },
                "metric": {
                    "amount": 2,
                    "unitShort": "tsps",
                    "unitLong": "teaspoons"
                }
            }
        },
        {
            "id": 1002014,
            "aisle": "Spices and Seasonings",
            "image": "ground-cumin.jpg",
            "consitency": "solid",
            "name": "ground cumin",
            "original": "1 tsp. ground cumin",
            "originalString": "1 tsp. ground cumin",
            "amount": 1,
            "unit": "tsp",
            "meta": [],
            "metaInformation": [],
            "measures": {
                "us": {
                    "amount": 1,
                    "unitShort": "tsp",
                    "unitLong": "teaspoon"
                },
                "metric": {
                    "amount": 1,
                    "unitShort": "tsp",
                    "unitLong": "teaspoon"
                }
            }
        },
        {
            "id": 20030,
            "aisle": "Canned and Jarred;Produce",
            "image": "corn-white.png",
            "consitency": "solid",
            "name": "hominy",
            "original": "1 15-oz. can hominy, rinsed and drained",
            "originalString": "1 15-oz. can hominy, rinsed and drained",
            "amount": 15,
            "unit": "oz",
            "meta": [
                "rinsed",
                "drained",
                "canned"
            ],
            "metaInformation": [
                "rinsed",
                "drained",
                "canned"
            ],
            "measures": {
                "us": {
                    "amount": 15,
                    "unitShort": "oz",
                    "unitLong": "ounces"
                },
                "metric": {
                    "amount": 425.243,
                    "unitShort": "g",
                    "unitLong": "grams"
                }
            }
        },
        {
            "id": 4053,
            "aisle": "Oil, Vinegar, Salad Dressing",
            "image": "olive-oil.jpg",
            "consitency": "liquid",
            "name": "olive oil",
            "original": "2 Tbs. olive oil, divided",
            "originalString": "2 Tbs. olive oil, divided",
            "amount": 2,
            "unit": "Tbs",
            "meta": [
                "divided"
            ],
            "metaInformation": [
                "divided"
            ],
            "measures": {
                "us": {
                    "amount": 2,
                    "unitShort": "Tbs",
                    "unitLong": "Tbs"
                },
                "metric": {
                    "amount": 2,
                    "unitShort": "Tbs",
                    "unitLong": "Tbs"
                }
            }
        },
        {
            "id": 11282,
            "aisle": "Produce",
            "image": "brown-onion.jpg",
            "consitency": "solid",
            "name": "onion",
            "original": "1 medium onion, diced (1 cup)",
            "originalString": "1 medium onion, diced (1 cup)",
            "amount": 1,
            "unit": "cup",
            "meta": [
                "diced",
                "medium"
            ],
            "metaInformation": [
                "diced",
                "medium"
            ],
            "measures": {
                "us": {
                    "amount": 1,
                    "unitShort": "cup",
                    "unitLong": "cup"
                },
                "metric": {
                    "amount": 236.588,
                    "unitShort": "g",
                    "unitLong": "grams"
                }
            }
        },
        {
            "id": 2027,
            "aisle": "Produce;Spices and Seasonings",
            "image": "oregano.jpg",
            "consitency": "solid",
            "name": "oregano",
            "original": "½ tsp. dried oregano",
            "originalString": "½ tsp. dried oregano",
            "amount": 0.5,
            "unit": "tsp",
            "meta": [
                "dried"
            ],
            "metaInformation": [
                "dried"
            ],
            "measures": {
                "us": {
                    "amount": 0.5,
                    "unitShort": "tsps",
                    "unitLong": "teaspoons"
                },
                "metric": {
                    "amount": 0.5,
                    "unitShort": "tsps",
                    "unitLong": "teaspoons"
                }
            }
        },
        {
            "id": 11821,
            "aisle": "Produce",
            "image": "red-bell-pepper.png",
            "consitency": "solid",
            "name": "red bell pepper",
            "original": "1 red bell pepper, cut into 1-inch dice",
            "originalString": "1 red bell pepper, cut into 1-inch dice",
            "amount": 1,
            "unit": "",
            "meta": [
                "red",
                "cut into 1-inch dice"
            ],
            "metaInformation": [
                "red",
                "cut into 1-inch dice"
            ],
            "measures": {
                "us": {
                    "amount": 1,
                    "unitShort": "",
                    "unitLong": ""
                },
                "metric": {
                    "amount": 1,
                    "unitShort": "",
                    "unitLong": ""
                }
            }
        },
        {
            "id": 2047,
            "aisle": "Spices and Seasonings",
            "image": "salt.jpg",
            "consitency": "solid",
            "name": "salt",
            "original": "¾ tsp. salt",
            "originalString": "¾ tsp. salt",
            "amount": 0.75,
            "unit": "tsp",
            "meta": [],
            "metaInformation": [],
            "measures": {
                "us": {
                    "amount": 0.75,
                    "unitShort": "tsps",
                    "unitLong": "teaspoons"
                },
                "metric": {
                    "amount": 0.75,
                    "unitShort": "tsps",
                    "unitLong": "teaspoons"
                }
            }
        },
        {
            "id": 1031009,
            "aisle": "Cheese",
            "image": "cheddar-cheese.jpg",
            "consitency": "solid",
            "name": "sharp cheddar cheese",
            "original": "2 oz. grated sharp Cheddar cheese (½ cup packed)",
            "originalString": "2 oz. grated sharp Cheddar cheese (½ cup packed)",
            "amount": 0.5,
            "unit": "cup",
            "meta": [
                "packed",
                "grated"
            ],
            "metaInformation": [
                "packed",
                "grated"
            ],
            "measures": {
                "us": {
                    "amount": 0.5,
                    "unitShort": "cups",
                    "unitLong": "cups"
                },
                "metric": {
                    "amount": 118.294,
                    "unitShort": "g",
                    "unitLong": "grams"
                }
            }
        },
        {
            "id": 11954,
            "aisle": "Produce",
            "image": "tomatillos.jpg",
            "consitency": "solid",
            "name": "tomatillos",
            "original": "½ lb. tomatillos, husked and quartered (1½ cups)",
            "originalString": "½ lb. tomatillos, husked and quartered (1½ cups)",
            "amount": 1.5,
            "unit": "cups",
            "meta": [
                "husked",
                "quartered"
            ],
            "metaInformation": [
                "husked",
                "quartered"
            ],
            "measures": {
                "us": {
                    "amount": 1.5,
                    "unitShort": "cups",
                    "unitLong": "cups"
                },
                "metric": {
                    "amount": 354.882,
                    "unitShort": "g",
                    "unitLong": "grams"
                }
            }
        }
    ],
    }
  }

  subject { OutsideRecipe.new(attrs) }
  it 'exists' do
    expect(subject).to be_an OutsideRecipe
  end

  context 'instance methods' do
    it '#title' do
      expect(subject.title).to eq('Spicy Fall Stew Baked in a Pumpkin')
    end

    it '#image' do
      expect(subject.image).to eq("https://spoonacular.com/recipeImages/759372-556x370.jpg")
    end

    it '#source_name' do
      expect(subject.source_name).to eq('Vegetarian Times')
    end

    it '#source_url' do
      expect(subject.source_url).to eq("http://www.vegetariantimes.com/recipe/spicy-fall-stew-baked-in-a-pumpkin/")
    end

    it '#instructions' do
      expect(subject.instructions).to eq('1. Preheat oven to 350°F. Heat 1 Tbs. oil in pot over medium heat. Add onion, bell pepper, and garlic. Sauté 7 minutes, or until softened. Stir in chili powder, cumin, and oregano, and cook 3 minutes more, or until spices darken.2. Add tomatillos, hominy, 1/2 cup water, and salt. Cover, and bring to a boil. Reduce heat to medium-low, and simmer, partially covered, 10 to 12 minutes, or until tomatillos are softened. Uncover, and cook 5 minutes more to thicken stew, if necessary.3. Meanwhile, cut top of pumpkin around stem to make lid. Scoop out pumpkin seeds and strings. Rub inside of pumpkin with remaining 1 Tbs. oil, and sprinkle generously with salt. Sprinkle cheese in bottom of pumpkin.4. Fill pumpkin with stew, then top with pumpkin lid. Place on parchment-covered baking sheet and bake 1 1/2 to 2 hours, or until pumpkin flesh is fork-tender. Remove from oven; let stand 5 minutes.5. Scoop stew, including pumpkin, into bowls and serve hot, topped with Poblano-Cucumber Salsa (Click here for recipe). ')
    end

    it '#total_time' do
      expect(subject.total_time).to eq(45)
    end

    it '#servings' do
      expect(subject.servings).to eq(6)
    end

    it '#spoonacular_id' do
      expect(subject.spoonacular_id).to eq(759372)
    end

    it '#ingredients' do
      subject.ingredients.each do |ingredient|
        expect(ingredient).to be_an OutsideIngredient
      end
    end
  end
end
