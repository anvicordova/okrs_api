# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Goal management", type: :request do
  let(:headers) { { "ACCEPT" => "application/json" } }

  describe "with valid params" do
    let(:goal) { build(:goal) }
    let(:request_params) { goal.attributes.slice("title", "start_date", "end_date") }

    it "creates a new goal" do
      post "/goals", params: { goal: request_params }, headers: headers

      aggregate_failures do
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "with invalid params" do
    let(:request_params) { { title: "Goal is missing other required fields" } }

    it "returns 404" do
      post "/goals", params: { goal: request_params }, headers: headers
      expect(response).to have_http_status(:bad_request)
    end
  end
end
