require 'rails_helper'

RSpec.feature 'User sees trails' do 
  scenario 'from home' do 
    user = create(:user)
    sign_in user
    visit root_path
    
    expect(page).to have_content('overlinks')    
  end

  scenario 'registered successfully' do
    user = create(:user)
    sign_in user
    create(:trail, name: 'trail 1')
    create(:trail, name: 'trail 2')
    
    visit trails_path

    expect(page).to have_content('trail 1')
    expect(page).to have_content('trail 2')
    expect(page).not_to have_content('Para iniciar, adicione uma trilha')
  end

  scenario 'and there is no trail registered yet' do
    user = create(:user)
    sign_in user

    visit trails_path

    expect(page).to have_content('Para iniciar, adicione uma trilha')
  end

  scenario 'without authentication' do
    create(:trail)
    visit trails_path

    expect(page).to have_corrent_path('new_user_session_path')
    expect(page).to have_content('Log in')
    expect(page).not_to have_content('test trail')
  end
end
