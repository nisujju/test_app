require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  scenario "checking all links" do
  	visit root_path
  	click_link('Help')
  	expect(page).to have_content 'help'
  	click_link('Home')
  	expect(page).to have_content 'Welcome'
  	click_link('About')
  	expect(page).to have_content 'About'
  	click_link('Contact')
  	expect(page).to have_content 'Contact'
  end
end
