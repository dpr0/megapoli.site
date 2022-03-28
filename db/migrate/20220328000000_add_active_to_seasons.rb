# This migration comes from active_storage (originally 20190112182829)

class AddActiveToSeasons < ActiveRecord::Migration[7.0]
  def change
    add_column :seasons, :active, :boolean, default: true
  end
end
