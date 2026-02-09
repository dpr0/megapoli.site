# frozen_string_literal: true

class Authorization < ApplicationRecord
  belongs_to :player, optional: true
end
