require 'rails_helper'
RSpec.describe Recipe, type: :model do
    before :each do
        @user = User.create!(name: 'user1', email: 'user1@localhost', password: 'password')
        puts @user.errors.full_messages
        @recipe = Recipe.create!(user: @user, name: 'Test recipe', preparation_time: 1, cooking_time: 2, description: 'Test description')

    end
    it ' Recipe model should be equal to the test recipe' do
        expect(@recipe.name).to eq('Test recipe')
        expect(@recipe.preparation_time).to eq(1)
        expect(@recipe.cooking_time).to eq(2)
        expect(@recipe.description).to eq('Test description')
    end

end