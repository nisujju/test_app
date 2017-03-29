require 'rails_helper'

RSpec.feature "Users", type: :feature do

    it "check edit user throws error if name is blank" do
    	user=User.first
    	visit edit_user_path(user)
    	fill_in 'Name', with: ''
  		fill_in 'Email', with: 'nitesh@gmail.com'
  		fill_in 'Password', with: 'password'
  		fill_in 'Confirmation', with: 'password'
  		click_button 'Save changes'
  		expect(page).to have_content "Name can't be blank"
  	end

     it "check successful edits" do
    	user=User.first
    	visit edit_user_path(user)
    	fill_in 'Name', with: 'Ujjwal'
  		fill_in 'Email', with: 'nitesh@gmail.com'
  		fill_in 'Password', with: ''
  		fill_in 'Confirmation', with: ''
  		click_button 'Save changes'
  		expect(page).to have_content "Profile updated"
  		expect(page.current_path).to eq '/users/#{user.id}'
  	end

end
