# frozen_string_literal: true

FactoryBot.define do
  factory :key_result, class: KeyResult do
    title { Faker::Lorem.sentence }
    goal
  end
end
