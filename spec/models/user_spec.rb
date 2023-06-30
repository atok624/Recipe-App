require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(name: 'user1', email: 'user1@localhost', password: 'password')
  end

  it 'User model should be equal to the test user' do
    expect(@user.name).to eq('user1')
    expect(@user.email).to eq('user1@localhost')
    expect(@user.password).to eq('password')
  end
end
