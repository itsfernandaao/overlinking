require 'rails_helper'

RSpec.feature 'User logs in', type: :feature do
  scenario 'from home' do
    visit root_path

    click_on 'entrar'

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Log in')
  end

  scenario 'successfully' do
    create(:user)
    visit root_path
    click_on 'entrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    
    expect(page).to have_current_path(feed_path)
    expect(page).to have_link('sair')
    expect(page).not_to have_link('entrar')
    expect(page).not_to have_link('cadastrar')
  end

  scenario 'with email registered' do
    visit root_path
    click_on 'entrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Log in')
    expect(page).to have_content('Invalid Email or password')
  end

  scenario 'with wrong password' do
    create(:user)
    visit root_path
    click_on 'entrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '12345'
    click_on 'Log in'

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end
end
