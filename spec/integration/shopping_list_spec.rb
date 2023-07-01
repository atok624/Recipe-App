require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'recipe show page' do
    before :each do
      @user = User.create!(name: 'user1', email: 'user1@localhost', password: 'password')
      @recipe = Recipe.create!(user: @user, name: 'Test recipe', preparation_time: 1, cooking_time: 2,
                               description: 'Test description')
      @test_food = Food.create!(user: @user, name: 'Test food', measurement_unit: 'kg', price: 1, quantity: 1)
      @recipe_food = RecipeFood.create!(quantity: 10, food: @test_food, recipe: @recipe)

      visit generate_shopping_list_path

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end
    it 'Shoping list content' do
      expect(page).to have_content('Shopping List')
      expect(page).to have_content('Food item to buy: 1')
      price = @test_food.price
      expect(page)
        .to have_content("Total: $#{(@recipe_food.quantity * price) - (price * @test_food.quantity)}")
    end
  end
end
