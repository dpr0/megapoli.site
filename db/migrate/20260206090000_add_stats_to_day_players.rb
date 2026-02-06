# This migration comes from active_storage (originally 20190112182829)

class AddStatsToDayPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :day_players, :new_elo, :float
    add_column :day_players, :days,    :integer
    add_column :day_players, :games,   :integer
    add_column :day_players, :win,     :integer
    add_column :day_players, :draw,    :integer
    add_column :day_players, :lose,    :integer
  end
end
