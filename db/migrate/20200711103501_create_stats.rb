# frozen_string_literal: true

class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :season_id
      t.integer :days
      t.integer :games
      t.integer :win
      t.integer :draw
      t.integer :lose
      t.float   :elo, default: 1500
    end
  end
end
