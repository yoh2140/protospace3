require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  given(:user) { build(:user) }

  scenario '新規ユーザー作成' do
    visit root_path
    click_on '新規登録'
    fill_in 'Username', with: user.username
    fill_in 'E-mail', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Member', with: user.member
    fill_in 'Profile', with: user.profile
    fill_in 'Works', with: user.works
    expect { click_on '作成する' }.to change(User, :count).by(1)
    expect(page).to have_selector '.alert-notice', text: 'Welcome! You have signed up successfully.'
    end
  end
