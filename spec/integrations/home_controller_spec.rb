require 'rails_helper'

describe 'root page', type: :feature do
  before { visit '/' }
  it 'some  check', js: true do
    expect(page).to have_content 'Welcome to E-shop'
  end

  it 'login' do
    binding.pry
    click_link('Login')
    expect(page).to have_content 'Log in'
  end
end