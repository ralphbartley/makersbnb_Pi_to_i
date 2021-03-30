require './app.rb'

feature 'User sign up' do
  scenario 'User can sign up to website' do
    visit('/sign_up')
    fill_in('username', with: 'Test_username')
    fill_in('password', with: 'password')
    click_button('Sign Up')

    expect(current_path).to eq('/welcome')
    expect(page).to have_content('Welcome Test_username')
  end
end
