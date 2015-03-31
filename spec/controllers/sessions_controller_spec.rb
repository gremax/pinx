require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  before do
    user = FactoryGirl.create(:user)
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the signin template' do
      get :new
      expect(response).to render_template('new')
    end
  end
end
