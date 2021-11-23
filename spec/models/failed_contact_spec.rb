# == Schema Information
#
# Table name: failed_contacts
#
#  id               :bigint           not null, primary key
#  address          :string
#  card_last_digits :string
#  credit_card      :string
#  date_of_birth    :string
#  deleted_at       :datetime
#  email            :string
#  error_messages   :text
#  franchise        :string
#  name             :string
#  telephone        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  contact_file_id  :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_failed_contacts_on_contact_file_id  (contact_file_id)
#  index_failed_contacts_on_deleted_at       (deleted_at)
#  index_failed_contacts_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_file_id => contact_files.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe FailedContact, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:contact_file) }
  end

  describe 'validations' do
    it { should validate_presence_of(:error_messages) }
  end

  describe 'scopes' do
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
