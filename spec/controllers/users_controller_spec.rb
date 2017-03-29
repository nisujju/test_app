require 'rails_helper'

RSpec.describe UsersController, type: :controller do

render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      visit signup_path
      expect(page).to have_content 'Sign up'
    end
  end

end
