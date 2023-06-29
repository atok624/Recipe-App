class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all # Replace this with the appropriate query to fetch the food records
  end


  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(params[:recipe_id]), notice: "Recipe food was successfully updated."
    else
      render :edit
    end
  end



  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_food.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Recipe_food is successfully Created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    redirect_to recipe_path(params[:recipe_id]), status: :see_other
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
