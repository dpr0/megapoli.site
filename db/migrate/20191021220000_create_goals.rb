# frozen_string_literal: true

class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :player
      t.references :game
      t.references :team
      t.references :season
      t.integer :assist_player_id
    end
  end
end
