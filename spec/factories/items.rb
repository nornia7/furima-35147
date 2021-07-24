FactoryBot.define do
  factory :item do

    item_name           { Faker::Lorem.word }
    description         { Faker::Lorem.sentence }
    category_id         { Faker::Number.within(range: 1..10) }
    status_id           { Faker::Number.within(range: 1..7) }
    shipping_charges_id { Faker::Number.within(range: 1..2) }
    shipping_area_id    { Faker::Number.within(range: 1..47) }
    shipping_date_id    { Faker::Number.within(range: 1..3) }
    item_price          { Faker::Number.within(range: 300..9999999) }
    
    association :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/dummy_image.png'), filename: 'dummy_image.png')
    end

  end
end
