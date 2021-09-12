require 'rails_helper'

RSpec.feature 'User sees trails' do 
  scenario 'from home' do 
    user = create(:user)
    sign_in user
    visit root_path
    
    expect(page).to have_content('overlinks')    
  end

  scenario 'successfully' do
     
  end
end
