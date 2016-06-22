FactoryGirl.modify do
  factory :store do
    trait :with_order_number_prefix do
      order_number_prefix 'MADE'
    end

    trait :with_default_locale do
      default_locale 'fr'
    end

    trait :with_currency_symbol_last do
      currency_symbol_first false
    end

    trait :with_timezone do
      timezone 'Europe/Amsterdam'
    end
  end
end
