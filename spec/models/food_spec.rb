require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create!(name: 'user1', email: 'user1@localhost', password: 'password')
    puts @user.errors.full_messages
    @test_food = Food.create!(user: @user, name: 'Test food', measurement_unit: 'kg', price: 1, quantity: 1)
  end

  it ' Food model should be equal to the test food' do
    expect(@test_food.name).to eq('Test food')
    expect(@test_food.measurement_unit).to eq('kg')
    expect(@test_food.price).to eq(1)
    expect(@test_food.quantity).to eq(1)
  end
end
