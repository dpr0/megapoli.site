# frozen_string_literal: true

class CreateChampionships < ActiveRecord::Migration[7.0]
  def change
    create_table :championships do |t|
      t.references :sport
      t.string :code
      t.string :name
      t.string :description
    end
  end
end
