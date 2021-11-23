# == Schema Information
#
# Table name: contacts
#
#  id               :bigint           not null, primary key
#  address          :string
#  card_last_digits :string
#  credit_card      :string
#  date_of_birth    :date
#  deleted_at       :datetime
#  email            :string
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
#  index_contacts_on_contact_file_id    (contact_file_id)
#  index_contacts_on_deleted_at         (deleted_at)
#  index_contacts_on_email_and_user_id  (email,user_id) UNIQUE
#  index_contacts_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_file_id => contact_files.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:contact_file) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:telephone) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:credit_card) }
    it { should validate_presence_of(:date_of_birth) }
    it { should allow_value('John Doe').for(:name) }
    it { should_not allow_value('John Doe - The First').for(:name) }
    it { should allow_value('test@mail.com').for(:email) }
    it { should_not allow_value('@test@mail.com').for(:email) }
    it { should allow_value('(+57)3000000000').for(:telephone) }
    it { should allow_value('(+20)300000000000').for(:telephone) }
    it { should_not allow_value('(+57)30 00000000').for(:telephone) }
    it { should_not allow_value('(+20)30-00000000').for(:telephone) }
    it { should allow_value('4111111111111111').for(:credit_card) }
    it { should allow_value('19901010').for(:date_of_birth) }
    it { should allow_value('1990-10-10').for(:date_of_birth) }
    it { should_not allow_value('1990/10/10').for(:date_of_birth) }
  end

  describe 'scopes' do
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
