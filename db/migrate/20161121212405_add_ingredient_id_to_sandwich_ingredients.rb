class AddIngredientIdToSandwichIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :sandwich_ingredients, :ingredient_id, :integer
  end
end
