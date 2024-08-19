# frozen_string_literal: true

class DayPlayer < ApplicationRecord
  belongs_to :day
  belongs_to :team
  belongs_to :player
  belongs_to :season

  def stat
    @stat ||= Stat.find_by(season_id: season_id, player_id: player_id)
  end
end
