# frozen_string_literal: true

class Championship < ApplicationRecord
  include Dictionary

  belongs_to :sport, optional: true
  has_many :seasons
end
