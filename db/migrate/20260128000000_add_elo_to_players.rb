# This migration comes from active_storage (originally 20190112182829)

class AddEloToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :elo, :integer
  end
end
