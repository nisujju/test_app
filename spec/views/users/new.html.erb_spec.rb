require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do

    it "check invalid form submission" do
    	visit signup_path
    	fill_in 'Name', with: 'Nitesh'
  		fill_in 'Email', with: 'nitesh@gmail.com'
  		fill_in 'Password', with: 'password'
  		fill_in 'Confirmation', with: '123456'
  		click_button 'Create my account'
  		expect(page).to have_content 'error'
  		expect(view).to render_template(:new)
  	end

    it "check valid form submission" do
    	visit signup_path
    	fill_in 'Name', with: 'Nitesh'
  		fill_in 'Email', with: 'nitesh@gmail.com'
  		fill_in 'Password', with: 'password'
  		fill_in 'Confirmation', with: 'password'
  		click_button 'Create my account'
  		expect(page).to have_content 'Welcome to the Sample App!'
  	end

end
