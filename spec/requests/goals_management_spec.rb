# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Goal management", type: :request do
  let(:goal) { build(:goal) }
  let(:request_params) { goal.attributes.slice("title", "start_date", "end_date") }

  it "creates a new goal" do
    headers = { "ACCEPT" => "application/json" }
    post "/goals", params: { goal: request_params }, headers: headers

    aggregate_failures do
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end
  end
end
