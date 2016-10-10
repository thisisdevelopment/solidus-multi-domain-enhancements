FactoryGirl.modify do
  factory :store do
    trait :with_order_number_prefix do
      order_number_prefix 'MADE'
    end

    trait :with_default_locale do
      default_locale 'fr'
    end

    trait :with_currency_symbol_after do
      currency_symbol_before false
    end

    trait :with_timezone do
      timezone 'Europe/Amsterdam'
    end

    trait :with_shipping_methods do
      transient do
        shipping_methods { create_list(:shipping_method, 2) }
      end

      after(:create) do |store, evaluator|
        store.shipping_methods << evaluator.shipping_methods
      end
    end
  end
end

FactoryGirl.define do
  factory :shipping_flat_percentage_calculator, class: Spree::Calculator::Shipping::FlatPercentItemTotal do
    preferred_flat_percent 10
  end

  factory :shipping_per_item_calculator, class: Spree::Calculator::Shipping::PerItem do
    preferred_amount 2
  end

  factory :shipping_flexi_rate_calculator, class: Spree::Calculator::Shipping::FlexiRate do
    preferred_first_item 10
    preferred_additional_item 1
  end
end
