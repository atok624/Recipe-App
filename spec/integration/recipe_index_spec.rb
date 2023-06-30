require "rails_helper"

RSpec.describe 'Recipe', type: :system do
    describe 'recipe index page' do
        before do
            @user = User.create!(name: 'Test', email: 'test@localhost', password: 'password')
            @recipe = Recipe.create!(user: @user, name: 'Test recipe', preparation_time: 1, cooking_time: 2, description: 'Test description', public: true)
            Recipe.create!(user: @user, name: 'Test recipe2', preparation_time: 1, cooking_time: 10, description: 'Test description2', public: true)
            visit recipes_path

            fill_in 'Email', with: 'test@localhost'
            fill_in 'Password', with: 'password'
            click_button 'Log in'
        end

        it 'Recipes List' do
            expect(page).to have_content 'Test recipe'
            expect(page).to have_content 'Test recipe2'
        end
        it 'Recipe description' do
            expect(page).to have_content 'Test description'
            expect(page).to have_content 'Test description2'
        end

        it 'When I click on that page, I expect to be taken to that page' do
            click_link 'Test recipe'
            expect(page).to have_current_path recipe_path(@recipe)
        end
        it 'When I click on a recipe remove btn, recipe is deleted.' do
            click_button 'REMOVE', match: :first
            expect(page).to_not have_content('Test description')
            expect(page).to have_content('Test description2')
        end
end
end

