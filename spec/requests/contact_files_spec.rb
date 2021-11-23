require 'rails_helper'

RSpec.describe ContactFilesController, type: :request do
  let!(:user) { create :user }
  let!(:contact_files) { create_list :contact_file, 3, user: user }

  describe 'GET #index' do
    context 'when the user is not signed in' do
      before { get contact_files_path }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(user)
      end

      subject { get contact_files_path }

      context 'with contact files' do
        before { subject }

        it { expect(assigns(:contact_files)).to match_array(contact_files) }
      end
    end
  end

  describe 'POST #create' do
  end
end
