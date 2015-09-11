FactoryGirl.define do
  factory :user do
    name "Daisi"
    email "daisi.sowemimo@yahoo.com"
    password "administrator"
    password_confirmation "administrator"

    factory :invalid_user do
      email nil
      password nil
      password_confirmation nil
    end
  end
end
