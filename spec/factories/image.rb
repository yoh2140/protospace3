include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :image do
    content     { fixture_file_upload("spec/factories/img/logo.jpg", 'image/jpg') }
    prototype

  end
end
