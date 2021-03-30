require 'spec_helper'
require './app.rb'

feature 'Testing Infrastructure' do
  scenario ' content appears on homepage' do
    visit ('/')
    expect(page).to have_content 'Testing Infrastructure'
  end
end
