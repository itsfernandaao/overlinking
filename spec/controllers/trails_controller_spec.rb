require 'rails_helper'

RSpec.describe TrailsController, type: :request do 
  context 'index' do
    it 'with trails registered' do
      user = create(:user)
      sign_in user
      create(:trail, name: 'trail 1')
      create(:trail, name: 'trail 2')

      get '/trails'

      expect(response).to render_template(:index)
    end

    it 'with no trails registered' do
      user = create(:user)
      sign_in user

      get '/trails'

      expect(response).to render_template(:index)
    end

    it 'without authentication' do
      get '/trails'

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'new' do
    it 'with authentication' do
      user = create(:user)
      sign_in user

      get '/trails/new'

      expect(response).to render_template(:new)
    end

    it 'without authentication' do
      get '/trails/new'

      expect(response).to redirect_to(new_user_session_path)
    end
    
  end

  context 'create' do
    it 'a trail successfully' do
      user = create(:user)
      sign_in user
      params = { trail: { name: 'trilha 1'} }

      post 'trails/create', params: params

      expect(response).to redirect_to(trails_path)
      expect(Trails.count).to eq(1)
      expect(Trails.last.name).to eq('trilha 1')
    end

    it 'without params' do
      user = create(:user)
      sign_in user

      post 'trails/create'

      expect(response).to redirect_to(new_trail_path)
      expect(Trails.count).to eq(0)
    end

    it 'with name = nil' do
      user = create(:user)
      sign_in user
      params = { trail: { name: nil } }

      post 'trails/create', params: params

      expect(response).to redirect_to(new_trail_path)
      expect(Trails.count).to eq(0)
    end

    it 'with name blank' do
      user = create(:user)
      sign_in user
      params = { trail: { name: '' } }

      post 'trails/create', params: params

      expect(response).to redirect_to(new_trail_path)
      expect(Trails.count).to eq(0)
    end

    it 'without authentication' do
      params = { trail: { name: 'trilha 1'} }

      post 'trails/create', params: params

      expect(response).to redirect_to(new_user_session_path)
      expect(Trails.count).to eq(0)
    end

  end
end
