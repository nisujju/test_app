require 'rails_helper'

RSpec.describe "static_pages/help.html.erb", type: :view do
    it "renders _event partial for each event" do
    	visit help_path
    	expect(response).to render_template(:partial => "_header")
  	end
end
