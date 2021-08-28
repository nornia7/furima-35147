FactoryBot.define do
  factory :order_shipping do

    zip_code            { '123-4567' }
    prefectures_id      { Faker::Number.within(range: 1..47)  }
    municipality        { Faker::Address.street_name }
    street_address      { Faker::Address.street_address }
    building_name       { Faker::Address.building_number }
    phone_number        { '0' + "#{Faker::Number.within(range: 7..9)}" + '0' + "#{Faker::Number.number(digits: 8)}" }
    token               { 'tok_aa1bb2cc3dd4ee5ff6gg7hh8ii9j' }
    
  end
end
