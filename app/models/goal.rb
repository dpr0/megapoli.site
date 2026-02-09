# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :team,   optional: true
  belongs_to :game,   optional: true
  belongs_to :season, optional: true
  belongs_to :player, optional: true
end
