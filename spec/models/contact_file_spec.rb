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
require 'rails_helper'

RSpec.describe ContactFile, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:contacts) }
  end

  describe 'validations' do
    it { should validate_attached_of(:file) }
    it { should validate_content_type_of(:file).allowing('application/vnd.ms-excel', 'text/csv') }
  end

  describe 'scopes' do
    it { should have_state(:on_hold) }
    it { should transition_from(:on_hold).to(:processing).on_event(:proccess) }
    it { should transition_from(:on_hold).to(:failed).on_event(:fail) }
    it { should transition_from(:processing).to(:failed).on_event(:fail) }
    it { should transition_from(:on_hold).to(:finished).on_event(:finish) }
    it { should transition_from(:processing).to(:finished).on_event(:finish) }
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
