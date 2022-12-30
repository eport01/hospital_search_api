FactoryBot.define do
  factory :hospital do
    hospital_id { Faker::Number.number }
    name { Faker::Address.street_name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
    beds { Faker::Number.number }
    trauma { Faker::Name.first_name}
  end
end
