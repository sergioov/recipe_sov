class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy ] 
	before_action :authenticate_user!, except: [:index, :show, :sort_directions]

	def index
		@recipe = Recipe.all.order("created_at DESC")
	end

	def show		
	end

	def new
		@recipe=current_user.recipes.build
	end

	def create
		@recipe=current_user.recipes.build(recipe_params)

		if @recipe.save 
			redirect_to @recipe, notice: "Succesfully created new recipe"
		else
			render 'new'
		end
	end

	def edit
	
	end


	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to root_path, notice: "Succesfully deleted recipe"
	end

	def sort_directions
		params[:direction].each_with_index do |id, index|
			direction = Direction.find(id)
			direction.update!(StepNum: index+1)
		end
		render nothing: true
	end

	private 

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, ingredients_attributes:[:id, :unit, :quantity , :name, :_destroy],
			directions_attributes:[:id,:StepNum ,:step, :_destroy]) 
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def direction_params
      params.require(:direction).permit(:id, :StepNum ,:step)
    end
end
