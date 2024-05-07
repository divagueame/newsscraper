# spec/factories/entries.rb

FactoryBot.define do
  factory :entry do
    title { 'Sample Entry' }
    position { 1 }
    comments { 0 }
    points { 0 }
  end
end
