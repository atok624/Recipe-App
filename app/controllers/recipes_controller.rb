class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :new, status: :unpocessable_entity
        end
    end
    
    def update
        @recipe = Recipe.find(params[:id])

        if @recipe.update(recipe_params)
            msg = 'Recipe is Private'
            msg = 'Recipe is Public' if @recipe.public
            redirect_to @recipe, notice: msg
        else
            redirect_to recipe_path(@recipe), alert: 'Unable to update recipe'
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy

        redirect_to recipes_path, status: :see_other
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
    end

end