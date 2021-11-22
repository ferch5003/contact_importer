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

  validates :file, attached: true, content_type: ['text/csv']
end
