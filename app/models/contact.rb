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
class Contact < ApplicationRecord
  include CreditCardeable
  include Matcheable

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

  validates :name, presence: true, format: { with: NAME_REGEX }
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :telephone, presence: true, format: { with: PHONE_REGEX }
  validates :address, presence: true
  validates :credit_card, presence: true, credit_card_number: true
  validates :date_of_birth, presence: true
  validate :iso_8601_valid_format

  before_save :save_credit_card
end
