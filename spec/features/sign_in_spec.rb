require './app.rb'

feature 'User sign in' do
  scenario 'User can sign in to website' do
    visit('/sign_in')
    fill_in('username', with: 'Test_username')
    fill_in('password', with: 'password')
    click_button('Sign In')

    expect(current_path).to eq('/welcome')
    expect(page).to have_content('Welcome Test_username')
  end
end