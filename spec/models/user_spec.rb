# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
  end
end