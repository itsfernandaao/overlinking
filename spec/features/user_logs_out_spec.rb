require 'rails_helper'

RSpec.feature 'User logs out', type: :feature do
  scenario 'from feed' do
    user = create(:user)
    sign_in user
    
    visit feed_path

    expect(page).to have_link('sair')
    expect(page).not_to have_link('entrar')
  end

  scenario 'successfully' do
    user = create(:user)
    sign_in user
    visit feed_path
    click_on 'sair'

    expect(page).to have_current_path(root_path)
    expect(page).to have_link('entrar')
    expect(page).to have_link('cadastrar')
    expect(page).to have_content('overlinking')
  end
end
