FactoryBot.define do
  factory :idea do

    sequence(:title){|n|  Faker::Job.title + "#{n}"}
    description { Faker::Job.field + "hi"*50 }

    association(:user, factory: :user)
  end
end
