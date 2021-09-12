require 'rails_helper'

RSpec.describe HomeController, type: :request do 
  context 'Enters home page' do
    it 'successfully' do
      get root_path

      expect(response).to render_template(:index)
    end
  end
end
