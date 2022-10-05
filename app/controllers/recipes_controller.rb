class RecipesController < ApplicationController
    before_action :authorize
  
    # GET /recipes
    def index
      recipes = Recipe.all
      render json: recipes, status: :created
    end
  
    # POST /recipes
    def create
      current_user = User.find_by(id: session[:user_id])
      recipe = current_user.recipes.create!(recipe_params)
      render json: recipe, status: :created
    end
  
    private
  
    def recipe_params
      params.permit(:title, :instructions, :minutes_to_complete)
    end
  end