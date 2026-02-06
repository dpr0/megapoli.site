# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :team
  belongs_to :game
  belongs_to :season
  belongs_to :player, optional: true
end
