require 'rails_helper'

RSpec.describe ContactFiles::Create, type: :model do
  let(:user) { create :user }

  describe '#call' do
    context 'when the file exist' do
      describe 'with invalid column headers' do
        let(:file) { fixture_file_upload('contacts_invalid_file.csv', 'application/vnd.ms-excel') }

        subject { described_class.call(file: file, user_id: user.id).success? }

        it { should be false }
      end

      describe 'with valid file' do
        let(:file) { fixture_file_upload('contacts_valid_file.csv', 'application/vnd.ms-excel') }

        subject { described_class.call(file: file, user_id: user.id).success? }

        it { should be true }
      end
    end
  end
end
