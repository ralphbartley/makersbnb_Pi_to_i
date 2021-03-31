require './app.rb'

feature 'User sign in' do
  scenario 'User can sign in to website' do
    con = PG.connect(dbname: ENV['TEST_NAME'])
    p con.exec("INSERT INTO users VALUES('1', 'Test_username', 'password')")
    visit('/sign_in')
    fill_in('username', with: 'Test_username')
    fill_in('password', with: 'password')
    click_button('Sign In')

    expect(current_path).to eq('/welcome')
    expect(page).to have_content('Welcome Test_username')
  end
end
