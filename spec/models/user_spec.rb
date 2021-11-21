require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
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
