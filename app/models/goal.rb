# frozen_string_literal: true

class Goal < ApplicationRecord
  validates :title, presence: true
end
