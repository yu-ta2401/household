FactoryBot.define do
  factory :item do
    name {'あああ'}
    price {'500'}
    explanation {'ああああ'}
    category_id {3}
    state_id {3}
    burden_id {3}
    shippingorigin_id {3}
    day_id {3}
    user_id {2}
    association :user

    after(:build) { 
      |item| item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png', content_type: 'image/png') 
    }
  end
end