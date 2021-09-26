FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "person #{n}"
    end
    last_name  { "Doe" }
    admin { false }
  end
end
