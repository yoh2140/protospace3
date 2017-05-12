require 'rails_helper'

RSpec.feature 'Sign in', type: :feature do
  given(:user) { FactoryGirl.build(:user) }
  background do
    login_as user
  end
  given(:prototype) { build(:prototype)}

  scenario '記事作成',js: true do
    visit new_user_session_path
    fill_in 'inputEmail', with: user.email
    fill_in 'inputPassword', with: user.password
    click_on  'ログインする'
    expect(page).to have_content 'Signed in successfully.'
    visit new_prototype_path
    fill_in 'prototype_title', with: prototype.title
    attach_file "prototype_images_attributes_0_content", File.join(Rails.root, 'spec/factories/img/mini.jpg'),  visible: false
    attach_file "prototype_images_attributes_0_content", File.join(Rails.root, 'spec/factories/img/mini.jpg'),  visible: false
    attach_file "prototype_images_attributes_0_content", File.join(Rails.root, 'spec/factories/img/mini.jpg'),  visible: false
    fill_in 'prototype_cach_copy', with: prototype.cach_copy
    fill_in 'prototype_concept', with: prototype.concept
    fill_in 'Wed Design', with: 'Tag1'
    fill_in 'UI', with: 'Tag2'
    fill_in 'Application', with: 'Tag3'
    click_on '作成'
    expect(page).to have_content '作成できました。'
  end

end


