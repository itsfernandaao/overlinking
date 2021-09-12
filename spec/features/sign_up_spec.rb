require 'rails_helper'

RSpec.feature 'SignUp', type: :feature do
  scenario 'from home' do
    visit root_path

    click_on 'cadastrar'

    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario 'successfully' do
    visit root_path
    click_on 'cadastrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_current_path(root_path)
    expect(User.count).to eq(1)
    expect(User.last.email).to eq('test@test.com')
  end

  scenario 'with existing user' do
    create(:user, email: 'test@test.com', password: '123456')
    visit root_path
    click_on 'cadastrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).not_to have_current_path(root_path)
    expect(page).to have_content('Email has already been taken')
    expect(User.count).to eq(1)  
  end

  scenario 'with wrong password confirmation' do
    visit root_path
    click_on 'cadastrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '12345'
    click_on 'Sign up'

    expect(page).not_to have_current_path(root_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.count).to eq(0)
  end

  scenario 'with email blank' do
    visit root_path
    click_on 'cadastrar'

    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).not_to have_current_path(root_path)
    expect(page).to have_content("Email can't be blank")
    expect(User.count).to eq(0)  
  end

  scenario 'with password blank' do
    visit root_path
    click_on 'cadastrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).not_to have_current_path(root_path)
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.count).to eq(0)    
  end

  scenario 'with password confirmation blank' do
    visit root_path
    click_on 'cadastrar'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_on 'Sign up'

    expect(page).not_to have_current_path(root_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.count).to eq(0)   
  end
end
