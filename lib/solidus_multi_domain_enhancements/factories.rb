FactoryGirl.modify do
  factory :store do
    trait :with_order_number_prefix do
      order_number_prefix 'MADE'
    end
  end
end
