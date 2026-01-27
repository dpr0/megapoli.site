# frozen_string_literal: true

class CreateDayPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :day_players do |t|
      t.references :season
      t.references :day
      t.references :player
      t.references :team
      t.float :elo
    end
  end
end
