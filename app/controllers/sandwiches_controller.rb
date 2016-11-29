class SandwichesController < ApplicationController
	protect_from_forgery with: :null_session
	def index
		sandwiches = Sandwich.all
		render json: sandwiches
	end

	def create
		sandwich = Sandwich.create(sandwich_params)
		render json: sandwich
	end
	def show
		sandwich = Sandwich.find(params[:id])
		sandwichid = sandwich.id
		# @sandwichIngredients= sandwich.ingredients
		ingredients = SandwichIngredient.where(sandwich_id: sandwichid)
		# sandwichIngredients each do |item|
		# 	sandwich.total_calories += item.calories
		# end
		render json: sandwich.to_json(include: :ingredients)
	end

	def update
		sandwich = Sandwich.find(params[:id])
		sandwich.update(sandwich_params)
		render json: sandwich
	end

	def destroy
		sandwich = Sandwich.find(params[:id])
		sandwich.destroy
		render json: sandwich
	end

	def add_ingredient
		sandwich = Sandwich.find(params[:id])
		ingredient = Ingredient.find(params[:ingredient_id])
		sandwich.ingredients.push(ingredient)
		sandwich.total_calories += ingredient.calories
		sandwich.save
		render json: sandwich.to_json(include: :ingredients)
	end

	private

	def sandwich_params
		params.require(:sandwich)
		.permit(:name, :bread_type, :total_calories)
	end
end
