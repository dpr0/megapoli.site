# frozen_string_literal: true

class SeasonsController < ApplicationController
  def index
    @seasons = Season.all.sort_by(&:code)
  end

  def show
    @season = Season.find(params[:id])
    @days = @season.days.sort
  end
end
