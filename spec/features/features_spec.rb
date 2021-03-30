require 'spec_helper'
require './app.rb'

feature 'Testing Infrastructure' do
  scenario ' content appears on homepage' do
    visit ('/')
    click_button('Sign Up')

    expect(current_path).to eq('/sign_up')
  end

  scenario ' content appears on homepage' do
    visit ('/')
    click_button('Sign In')

    expect(current_path).to eq('/sign_in')
  end
end
