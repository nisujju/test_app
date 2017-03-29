require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do

	it "checks the login functionality" do
    	visit signup_path
  		fill_in 'Name', with: 'Nitesh1'
  		fill_in 'Password', with: 'password'
  		fill_in 'Email', with: 'njha1@gmail.com'
  		fill_in 'Confirmation', with: 'password'
  		click_button 'Create my account'
  		expect(page).to have_content("Welcome to")
  		# expect(helper.session[:user_id]).not_to be_nil
  	end
end
