# frozen_string_literal: true

class DayPlayer < ApplicationRecord
  belongs_to :day, optional: true
  belongs_to :team, optional: true
  belongs_to :player, optional: true
  belongs_to :season, optional: true
end
