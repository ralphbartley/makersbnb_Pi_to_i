require './app.rb'

feature 'Listing Space' do
  scenario 'User can list space' do
    visit('/listings/new')
    fill_in('name', with: 'Test_space')
    fill_in('description', with: 'Lovely area with a garden and a little path running down the middle.')
    fill_in('daily_price', with: '100')
    click_button('List')

    expect(current_path).to eq('/listings')
    expect(page).to have_content('Test_space')
  end
end