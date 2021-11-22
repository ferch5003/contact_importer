FactoryBot.define do
  factory :contact_file do
    association :user
    file { TestFilesHelper.upload(filename: 'mocks/contacts_valid_file.csv') }
    status { :on_hold }
  end
end
