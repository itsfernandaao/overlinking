require 'rails_helper'

RSpec.describe User, type: :model do
  context 'creates a user' do
    it 'successfully' do
      User.create(email: 'test@test.com', password: '123456')

      expect(User.last.email).to eq('test@test.com')
    end
  end

  context 'cant create a user' do
    it 'with duplicate email' do
      User.create(email: 'test@test.com', password: '123456')

      expect{ User.create!(email: 'test@test.com', password: '123456')}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email has already been taken')
    end
  end
end
