require 'rails_helper'

RSpec.feature 'Visitor visits home', type: :feature do
 scenario 'successfully' do
  visit root_path

  expect(page).to have_content('overlinking')
  expect(page).to have_link('entrar')
  expect(page).to have_link('cadastrar')
  expect(page).not_to have_link('sair')
 end
end
