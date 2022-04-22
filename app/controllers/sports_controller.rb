# frozen_string_literal: true

class SportsController < ApplicationController
  def index
    @sports = Sport.eager_load(:championships).sort_by(&:code)
  end

  def show
    @sport = Sport.find(params[:id])
    @championships = @sport.championships.sort_by(&:id)
  end
end
