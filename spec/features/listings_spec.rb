require './app.rb'

feature 'List Spaces' do
  scenario 'User see list of space' do
    #con = PG.connect(dbname: ENV['TEST_NAME'])
    #con.exec("INSERT INTO spaces VALUES('1', 'Test_space', 'Lovely area with a garden and a little path running down the middle.', '100', '1')")
    #visit('/listings')

    visit('/listings/new')
    fill_in('name', with: 'Test_space')
    fill_in('description', with: 'Lovely area with a garden and a little path running down the middle.')
    fill_in('daily_price', with: '100')
    click_button('List')

    click_button('View')

    expect(page).to have_content('Test_space')
    expect(page).to have_content('Lovely area with a garden and a little path running down the middle.')
    expect(page).to have_content('100')
  end
end