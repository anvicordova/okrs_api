# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Goal management", type: :request do
  let(:current_user) { create(:user) }
  let(:headers) { valid_headers }

  describe "with valid params" do
    let(:goal) { build(:goal) }
    let(:request_params) { { goal: { title: "Learn" } }.to_json }

    it "returns status code 201" do
      post "/goals", params: request_params, headers: headers

      expect(response).to have_http_status(:created)
    end

    it "creates a new goal with the current user as the owner" do
      post "/goals", params: request_params, headers: headers

      expect(Goal.last.owner).to eq current_user
    end

    context "When a different goal owner is specified" do
      let!(:goal_owner) { create(:user) }

      let(:request_params) do
        {
          goal: {
            title: "Learn",
            owner_id: goal_owner.id
          }
        }.to_json
      end

      it "creates a new goal with the user as owner" do
        post "/goals", params: request_params, headers: headers

        expect(Goal.last.owner).to eq goal_owner
      end
    end
  end

  describe "with invalid params" do
    let(:request_params) { { goal: { title: "" } }.to_json }

    it "returns 404" do
      post "/goals", params: request_params, headers: headers
      expect(response).to have_http_status(:bad_request)
    end
  end
end
