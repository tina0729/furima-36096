FactoryBot.define do
  factory :product do
    product_name          {Faker::Lorem.sentence}
    information           {Faker::Lorem.sentence}
    price                 {55555}
    category_id           {2}
    condition_id          {2}
    shipping_id           {2}
    prefecture_id         {2}
    shipment_date_id      {2}
    
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end  
  end
end
