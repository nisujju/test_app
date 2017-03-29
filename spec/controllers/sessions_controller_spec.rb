require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "checks for flash message persist on one page after incorrect submission" do
  	    visit login_path
  		fill_in 'Email', with: 'njha@gmail.com'
  		fill_in 'Password', with: 'password123'
  		click_button 'Log in'
  		expect(page).to have_content 'Invalid email/password combination'
  		expect(response).to render_template(:new)
  		visit root_path
  		expect(page).not_to have_content 'Invalid email/password combination'
    end

    it "valid logins and links after same" do
  	    visit login_path
  		fill_in 'Email', with: 'njha@gmail.com'
  		fill_in 'Password', with: 'password'
  		click_button 'Log in'
  		# expect(page).to have_content('Nitesh')
  		expect(page).to have_current_path(user_path(User.find_by(email: "njha@gmail.com"))) 
  		find_link('Profile', :visible => :all).visible?
  		find_link('Settings', :visible => :all).visible?
  		find_link('Log out', :visible => :all).visible?
  		visit root_path
  		expect(page).not_to have_content 'Invalid email/password combination'
    end

    it "checks logout" do
  	    visit login_path
  		fill_in 'Email', with: 'njha@gmail.com'
  		fill_in 'Password', with: 'password'
  		click_button 'Log in'
  		# expect(page).to have_content('Nitesh')
  		expect(page).to have_current_path(user_path(User.find_by(email: "njha@gmail.com"))) 
  		find_link('Profile', :visible => :all).visible?
  		find_link('Settings', :visible => :all).visible?
  		find_link('Log out', :visible => :all).visible?
  		click_link('Log out')
  		find_link('Log in', :visible => :all).visible?	
    end

  end

end
