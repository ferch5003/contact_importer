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
class ContactFile < ApplicationRecord
  include AASM

  aasm column: 'status' do
    state :on_hold, initial: true
    state :processing, :failed, :finished

    event :proccess do
      transitions from: :on_hold, to: :processing
    end

    event :fail do
      transitions from: %i[on_hold processing], to: :failed
    end

    event :finish do
      transitions from: %i[on_hold processing], to: :finished
    end
  end
  acts_as_paranoid

  delegate :filename, to: :file

  belongs_to :user
  has_one_attached :file
  has_many :contacts

  validates :file, attached: true, content_type: ['application/vnd.ms-excel', 'text/csv']
end
