# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :day
      t.integer :team_left_id
      t.integer :team_right_id
      t.integer :goals_left,            default: 0
      t.integer :goals_right,           default: 0
      t.integer :left_team_elo,         default: 0
      t.integer :right_team_elo,        default: 0
      t.integer :left_team_elo_change,  default: 0
      t.integer :right_team_elo_change, default: 0
      t.string :comment
    end
  end
end
