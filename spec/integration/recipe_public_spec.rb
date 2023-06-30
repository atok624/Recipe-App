require 'rails_helper'

RSpec.describe 'User index page', type: :system do
    describe '  Recipe' do
        before do
            @user = User.create!(name: 'Test', email: 'test@localhost', password: 'password')
            @recipe = Recipe.create!(user: @user, name: 'Test recipe', preparation_time: 1, cooking_time: 2, description: 'Test description', public: true)
            @recipe = Recipe.create!(user: @user, name: 'Test recipe2', preparation_time: 1, cooking_time: 10, description: 'Test description2', public: false)
            visit root_path
        end
        scenario 'Public recipe is displayed on public_recipes page' do
            expect(page).to have_content 'Test recipe'
        end

        scenario 'Public recipe is not displayed on public_recipes page' do
            expect(page).to_not have_content 'Test recipe2'
        end
    end
end