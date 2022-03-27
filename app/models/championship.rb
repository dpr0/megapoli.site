# frozen_string_literal: true

class Championship < ApplicationRecord
  include Dictionary

  belongs_to :sport
  has_many :seasons
end
