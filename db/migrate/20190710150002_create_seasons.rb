# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.references :championship
      t.string :code
      t.string :name
      t.string :description
    end
  end
end
