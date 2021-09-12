require 'rails_helper'

RSpec.feature 'User enters feed' do 
  scenario 'sucessfully' do 
    user = create(:user)
    sign_in user
    visit root_path
    click_on 'feed'

    expect(page).to have_current_path(feed_path)
  end

  scenario 'and is not logged in' do 
    visit feed_path

    expect(page).not_to have_current_path(feed_path)
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Log in')
  end
end
