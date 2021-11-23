require 'rails_helper'

RSpec.describe "ContactFiles::Imports", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/contact_files/imports/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/contact_files/imports/create"
      expect(response).to have_http_status(:success)
    end
  end

end
