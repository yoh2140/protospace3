require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  given(:user) { build(:user) }

  scenario '新規ユーザー作成' do
    def sign_up(user)
      fill_in 'Username', with: user.username
      fill_in 'E-mail', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Member', with: user.member
      fill_in 'Profile', with: user.profile
      fill_in 'Works', with: user.works
      click_on '作成する'
    end
    visit root_path
    click_on '新規登録'
    sign_up(user)
    expect(page).to have_selector '.alert-notice', text: 'Welcome! You have signed up successfully.'
  end

end
