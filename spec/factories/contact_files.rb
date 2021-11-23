# == Schema Information
#
# Table name: contact_files
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_contact_files_on_deleted_at  (deleted_at)
#  index_contact_files_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :contact_file do
    association :user
    file { TestFilesHelper.upload(filename: 'mocks/contacts_valid_file.csv') }
    status { :on_hold }
  end
end
