# frozen_string_literal: true

class CreateSports < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :code
      t.string :name
      t.string :description
    end
  end
end
