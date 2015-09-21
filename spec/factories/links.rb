FactoryGirl.define do
  factory :link do
    association :user
    full_link_address "www.apple.co.uk"
    shortened_link_address "http://localhost:3000/BPPptM3-HTw"
  end

end
