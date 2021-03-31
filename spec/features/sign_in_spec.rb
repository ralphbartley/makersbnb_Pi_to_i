require './app.rb'
require 'web_helper.rb'

feature 'User sign in' do
  scenario 'User can sign in to website' do
    sign_in
    expect(current_path).to eq('/welcome')
    expect(page).to have_content('Welcome Test')
  end
end
