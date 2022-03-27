# frozen_string_literal: true

class DayPlayersController < ApplicationController
  def index
    @day_players = DayPlayer.sort_by(&:code)
  end

  def show
    @day_player = DayPlayer.find(params[:id])
    @days = @championship.days
  end
end
