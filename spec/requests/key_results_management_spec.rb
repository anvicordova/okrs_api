# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Goal management", type: :request do
  let(:headers) { { "ACCEPT" => "application/json" } }
  let!(:goal) { create(:goal) }

  describe "with valid params" do
    let(:request_params) { { title: "New key result" } }

    it "creates a new key result" do
      post "/goals/#{goal.id}/key_results", params: { key_result: request_params }, headers: headers
      expect(response).to have_http_status(:created)
    end
  end

  describe "with invalid params" do
    let(:request_params) { { title: "" } }

    it "returns 404" do
      post "/goals/#{goal.id}/key_results", params: { key_result: request_params }, headers: headers
      expect(response).to have_http_status(:bad_request)
    end
  end
end
