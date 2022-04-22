# frozen_string_literal: true

class ChampionshipsController < ApplicationController
  def index
    @championships = Championship.eager_load(:seasons).sort_by(&:code)
  end

  def show
    @championship = Championship.find(params[:id])
    @seasons = @championship.seasons.sort
  end
end
