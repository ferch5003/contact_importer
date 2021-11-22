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
