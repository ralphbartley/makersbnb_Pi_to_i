require './app.rb'

feature 'List Spaces' do
  scenario 'User see list of space' do
    sign_in
    list_space

    click_button('View')

    expect(page).to have_content('Test_space')
    expect(page).to have_content('Lovely area with a garden and a little path running down the middle.')
    expect(page).to have_content('100')
  end
end