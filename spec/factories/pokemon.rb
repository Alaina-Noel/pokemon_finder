require 'faker'

FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    height { Faker::Number.number(digits: 2) }
    weight { Faker::Number.number(digits: 2)  }
    abilities { Faker::Lorem.characters(number: 10) }
    forms{ Faker::Lorem.characters(number: 10)  }
    moves { Faker::Lorem.characters(number: 10) }
  end
end