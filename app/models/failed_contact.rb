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
class FailedContact < ApplicationRecord
  include CreditCardeable

  belongs_to :user
  belongs_to :contact_file

  class << self
    def bulk_proccess(contacts)
      contacts.each do |contact|
        contact.run_callbacks(:save) { false }
      end
      import contacts, recursive: true, validate: false, timestamps: true
    end
  end

  validates :error_messages, presence: true

  before_save :save_credit_card
end
