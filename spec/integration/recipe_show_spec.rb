require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'recipe show page' do
    before :each do
      @user = User.create!(name: 'user1', email: 'user1@localhost', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @recipe = Recipe.create!(user: @user, name: 'Test recipe', preparation_time: 1, cooking_time: 2,
                               description: 'Test description', public: true)
      visit recipe_path(@recipe)
    end
    it 'Recipe Content' do
      expect(page).to have_content('Test recipe')
      expect(page).to have_content("Preparation time: #{@recipe.preparation_time} hours")
      expect(page).to have_content("Cooking time: #{@recipe.cooking_time} hours")
    end
    it 'Recipe description' do
      expect(page).to have_content('Test description')
    end
    it 'When I click on a shopping list button, I am redirected to the shopping list page' do
      click_button 'Generate shopping list'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_current_path(generate_shopping_list_path)
    end
    it 'When I click on an Ingredients button, I am redirected to the Add page ingredients' do
      click_button 'Add Ingredient'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe))
    end
    it 'Click on a toggle button' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      visit recipe_path(@recipe)
      check('toggle-btn')
      expect(page).to have_checked_field('toggle-btn')
    end
  end
end
