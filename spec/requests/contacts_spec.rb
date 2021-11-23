require 'rails_helper'

RSpec.describe ContactsController, type: :request do
  let!(:user) { create :user }
  let!(:contact_file) { create :contact_file }
  let!(:contacts) { create_list :contact, 3, user: user, contact_file: contact_file }

  describe 'GET #index' do
    context 'when the user is not signed in' do
      before { get contacts_path }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(user)
      end

      subject { get contacts_path }

      context 'with contacts' do
        before { subject }

        it { expect(assigns(:contacts)).to match_array(contacts) }
      end
    end
  end
end
