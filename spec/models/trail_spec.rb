require 'rails_helper'

RSpec.describe Trail, type: :model do
  context 'validates uniqueness' do 
    it 'successfully' do
      create(:trail, name: 'trail 1')

      expect{ Trail.create!(name: 'trail 1') }.to raise_error(ActiveRecord, 'uniqueness')
    end
  end

  context '#sanitize' do 
    it 'downcase names successfully' do
      create(:trail, name: 'Trail 1')

      expect(Trail.last.name).to eq('trail 1')
    end
  end
end
