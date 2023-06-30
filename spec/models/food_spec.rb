require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create!(name: 'user1', email: 'user1@localhost', password: 'password')
    puts @user.errors.full_messages
    @test_food = Food.create!(user: @user, name: 'Test food', measurement_unit: 'kg', price: '1', quantity: 1)
  end

  it 'should save the food with correct columns and data types' do
    expect(@test_food.name).to eq('Test food')
    expect(@test_food.measurement_unit).to eq('kg')
    expect(@test_food.price.to_i).to eq(1)
    expect(@test_food.quantity).to eq(1)
  end

  it 'should fail to save a food without a user' do
    food_without_user = Food.new(name: 'Food without user', measurement_unit: 'kg', price: '1', quantity: 1)
    expect(food_without_user.save).to be_falsey
    expect(food_without_user.errors[:user]).to include("must exist")
  end

  it 'should fail to save a food with an invalid user' do
    food_with_invalid_user = Food.new(user: nil, name: 'Invalid food', measurement_unit: 'kg', price: '1', quantity: 1)
    expect(food_with_invalid_user.save).to be_falsey
    expect(food_with_invalid_user.errors[:user]).to include("must exist")
  end
end
