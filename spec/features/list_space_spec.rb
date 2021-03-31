require './app.rb'

feature 'Listing Space' do
  scenario 'User can list space' do
    sign_in
    list_space

    expect(current_path).to eq('/listings')
    expect(page).to have_content('Test_space')
    expect(page).to have_content('Lovely area with a garden and a little path running down the middle.')
    expect(page).to have_content('100')
  end
end