FactoryGirl.modify do
  factory :store do
    trait :with_order_number_prefix do
      order_number_prefix 'MADE'
    end

    trait :with_default_locale do
      default_locale 'fr'
    end
  end
end
