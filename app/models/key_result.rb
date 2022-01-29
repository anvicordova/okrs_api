# frozen_string_literal: true

class KeyResult < ApplicationRecord
  validates :title, presence: true, length: { maximum: 180 }, allow_blank: false

  belongs_to :goal

  def started?
    started_at.nil?
  end

  def in_progress?
    started_at.present? && completed_at.nil?
  end

  def completed?
    completed_at.present?
  end
end
