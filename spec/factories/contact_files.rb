FactoryBot.define do
  factory :contact_file do
    association :user
    status { :on_hold }
  end
end
