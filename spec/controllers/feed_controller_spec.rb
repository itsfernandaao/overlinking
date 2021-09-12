require 'rails_helper'

RSpec.describe FeedController, type: :request do 
  context 'Enters feed page' do
    it 'successfully' do
      user = create(:user)
      sign_in user

      get feed_path

      expect(response).to render_template(:index)
    end

    it 'without authentication' do
      get feed_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
