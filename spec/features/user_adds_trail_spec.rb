require 'rails_helper'

RSpec.feature 'User adds trail', type: :feature do 
  scenario 'from home' do 
    user = create(:user)
    sign_in user
    visit root_path
    click_on 'overlinks'
    
    expect(page).to have_current_path(trails_path)
    expect(page).to have_content('[+]trilha')
  end

  scenario 'succesfully' do 
    user = create(:user)
    sign_in user
    visit trails_path
    click_on '[+]trilha'

    fill_in 'trilha:', with: 'trilha 1'
    click_on 'criar'

    expect(page).to have_current_path(trails_path)
    expect(page).to have_content('trilha 1')
    expect(Trail.count).to eq(1)
  end

  scenario 'with name already used' do 
    user = create(:user)
    sign_in user
    create(:trail, name: 'trilha 1')
    visit trails_path
    click_on '[+]trilha'

    fill_in 'trilha:', with: 'trilha 1'
    click_on 'criar'

    expect(page).to have_current_path(new_trail_path)
    expect(page).not_to have_content('trilha 1')
    expect(page).to have_content('Already sei la o que')
    expect(Trail.count).to eq(0)
  end

  scenario 'with name in blank' do 
    user = create(:user)
    sign_in user
    visit trails_path
    click_on '[+]trilha'

    click_on 'criar'

    expect(page).to have_current_path(new_trail_path)
    expect(page).to have_content("Name can't be blank")
    expect(Trail.count).to eq(0)
  end

  scenario 'without authentication' do 
    visit new_trail_path

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Log in')
  end
end
