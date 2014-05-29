FactoryGirl.define do
  factory :produceable_component do
    association :component, factory: :produceable
    association :product, factory: :produceable
    qty { Random.rand(11) }
  end

  factory :produceable do
    sequence :name do |n|
      "Fake #{n}"
    end
    value { Random.rand(1e7).floor }
    blueprint_cost { Random.rand(1e6).floor }
    type "Produceable"
  end
end
