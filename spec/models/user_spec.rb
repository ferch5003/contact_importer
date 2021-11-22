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
