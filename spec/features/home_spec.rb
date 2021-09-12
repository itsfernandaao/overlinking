require 'rails_helper'

RSpec.feature 'Home', type: :feature do
 scenario 'User not logged visits the page' do
  visit root_path

  expect(page).to have_content('overlinking')
  expect(page).to have_link('entrar')
  expect(page).to have_link('cadastrar')
 end
end
