require 'factory_girl'

FactoryGirl.define do
  factory :product do
    name 'Default Item'
  end

  factory :blueprint, class: Product do
    name Forgery::LoremIpsum::word
    source :blueprint
  end
end

