require "rails_helper"

RSpec.describe 'Foods', type: :system do
    describe 'Food index page' do
        before do
            @user = User.create!(name: 'user1', email: 'user1@localhost', password: 'password')
            @food1 = Food.create!(name: 'food1', measurement_unit: 'food1 grams', price: 11, quantity: 1, user: @user)
            @food2 = Food.create!(name: 'food2', measurement_unit: 'food2 grams', price: 22, quantity: 2, user: @user)
            visit foods_path

           fill_in 'Email', with: 'user1@localhost'
           fill_in 'Password', with: 'password'
           click_button 'Log in'
        end

    # scenario 'A food list is displayed on foods page' do
    #    expect(page).to have_content 'food1'
    #    expect(page).to have_content 'food2'
    # end

    # scenario 'Price of each food is displayed on foods page`' do
    #     expect(page).to have_content '11'
    #     expect(page).to have_content '22'
    # end
    # scenario 'Quantity of each food is displayed on foods page`' do
    #     expect(page).to have_content '1'
    #     expect(page).to have_content '2'
    # end
    # scenario 'A measurement unit of each food is displayed on foods page`' do
    #     expect(page).to have_content 'food1 grams'
    #     expect(page).to have_content 'food2 grams'
    # end
    scenario 'When I click on a remove btn, food is deleted.' do
        click_button 'Remove', id: "remove-button-#{@food1.id}"
        expect(page).to_not have_content('food1 grams')
        expect(page).to have_content('food2')
      end
end
end

