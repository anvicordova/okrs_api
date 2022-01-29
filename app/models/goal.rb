# frozen_string_literal: true

class Goal < ApplicationRecord
  validates :title, presence: true, length: { maximum: 180 }, allow_blank: false
  validates :start_date, :end_date, presence: true, allow_blank: false
  validate :end_date_is_after_start_date

  has_many :key_results

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "can't be before to start_date") if end_date < start_date
  end
end
