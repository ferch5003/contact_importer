# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at            (deleted_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:contacts) }
    it { should have_many(:contact_files) }
    it { should have_many(:failed_contacts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'scopes' do
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
