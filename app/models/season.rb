# frozen_string_literal: true

class Season < ApplicationRecord
  include Dictionary

  has_many :days
  has_many :goals
  has_many :stats
  has_many :day_players
  belongs_to :championship

  def self.days_by_season_id(season_id)
    cached_by_id[season_id].days.map(&:id)
  rescue StandardError
  end
end
