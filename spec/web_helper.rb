def sign_in
    visit('/sign_in')
    fill_in('username', with: 'Test')
    fill_in('password', with: 'password')
    click_button('Sign In')
end

def list_space
    visit('/listings/new')
    fill_in('name', with: 'Test_space')
    fill_in('description', with: 'Lovely area with a garden and a little path running down the middle.')
    fill_in('daily_price', with: '100')
    click_button('List')
end