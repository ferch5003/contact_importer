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
        it { expect(assigns(:contact_file)).to be_a_new(ContactFile) }
      end
    end
  end

  describe 'POST #create' do
    let(:params) { { contact_file: contact_file_params } }

    context 'when the user is not signed in' do
      before { post contact_files_path }

      it { is_expected.to redirect_to(new_user_session_path) }
    end

    context 'when the user is signed in' do
      before do
        sign_in(user)
      end

      context 'with valid parameters' do
        let(:contact_file_params) do
          {
            file: fixture_file_upload('contacts_valid_file.csv', 'application/vnd.ms-excel')
          }
        end

        subject { post contact_files_path, params: params }

        it { expect { subject }.to change(ContactFile, :count).by(1) }
        it { is_expected.to redirect_to(contact_files_path) }
      end

      context 'with invalid parameters' do
        let(:contact_file_params) do
          {
            file: fixture_file_upload('contacts_invalid_file.csv', 'application/vnd.ms-excel')
          }
        end

        subject { post contact_files_path, params: params }

        it { is_expected.to redirect_to(contact_files_path) }
      end

      context 'when the file is not p´resent' do
        subject { post contact_files_path }

        it { is_expected.to redirect_to(contact_files_path) }
      end
    end
  end
end
