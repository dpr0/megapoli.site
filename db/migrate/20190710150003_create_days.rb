# frozen_string_literal: true

class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.references :season
      t.date     :date
      t.integer  :first_place
      t.integer  :second_place
      t.integer  :third_place
      t.integer  :fourth_place
      t.string   :videos, default: ''
    end
  end
end
