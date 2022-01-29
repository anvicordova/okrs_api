# frozen_string_literal: true

require "rails_helper"

RSpec.describe KeyResult, type: :model do
  subject { create(:key_result) }

  describe "validations" do
    it { should validate_presence_of(:title) }
  end
end
