# frozen_string_literal: true

class DaysController < ApplicationController
  before_action :load_players, only: [:edit, :new, :next, :show]
  before_action :players_list, only: [:edit, :new, :show]
  before_action :find_day, only: [:show, :edit, :update]
  before_action :find_games, only: [:show, :edit]
  before_action :authenticate_player!, only: :next

  def index
    @season = params[:season_id] ? Season.find(params[:season_id]) : Season.last
    @days = Day.where(season_id: @season.id).joins(:day_players).eager_load!(:day_players).order(id: :desc)
    @places = @days.select(:first_place, :second_place, :third_place, :fourth_place, :season_id)
    @players = Player.where(id: @season.day_players.map(&:player_id)).eager_load(:goals).sort_by(&:code)
    @days_by_wday = Day.where(season_id: @season.id).group_by { |x| x.date.wday }
    players = Player
      .joins(:stats)
      .left_joins(:goals)
      .left_joins(:day_players)
      .select("
        players.id,
        players.name,
        players.lastname,
        players.middlename,
        stats.days as days,
        stats.games as games,
        stats.win as win,
        stats.draw as draw,
        stats.lose as lose,
        stats.elo as stats_elo,
        (select count(*) from goals where goals.season_id = #{params[:season_id]} and goals.player_id = players.id) as goals_count,
        (select count(*) from goals where goals.season_id = #{params[:season_id]} and goals.assist_player_id = players.id) as assists_count,
        (select (1.0 * count(goals)/ NULLIF(stats.days, 0)) from goals where goals.season_id = #{params[:season_id]} and goals.player_id = players.id) as goals_day_count,
        (select (1.0 * count(goals)/ NULLIF(stats.days, 0)) from goals where goals.season_id = #{params[:season_id]} and goals.assist_player_id = players.id) as assists_day_count
      ")
      .where("stats.season_id = #{params[:season_id]}")
      .where("day_players.player_id = players.id and day_players.season_id = #{params[:season_id]}")
      .group(:id, :days, :games, :win, :draw, :lose, :stats_elo)
      .order("#{ordering} DESC")
    k = params[:k] || Stat::K_ATTENDANCE
    games_percent = @season.days.count * k.to_i / 100.0
    players = players.where("day_players.team_id = #{Team[params[:team]].id }") if params[:team]
    @arr_by_days = [
      players.select { |z| z.days && z.days >= games_percent },
      "Посещаемость менее #{Stat::K_ATTENDANCE}%", players.select { |z| z.days && z.days < games_percent }
    ]
  end

  def show
    @breadcrumbs = { '' => root_path }
    @main_table = TeamStat.new(@games).data

    @goals = Goal.where(game_id: @games.ids)
    @player_goals = sorted_hash(@goals.group_by(&:player_id))
    @player_assists = sorted_hash(@goals.group_by(&:assist_player_id))
  end

  def new; end

  def create
    last_season_id = Season.last.id
    @day = Day.new(date: params[:day][:date], sport_id: 1, season_id: last_season_id)
    params[:day][:day_players_attributes].values
      .group_by { |h| h['team_id'] }
      .transform_values { |v| v.map { |h| h['player_id'].to_i } }
      .each do |team_id, players|
        players.each do |player_id|
          @day.day_players.new(team_id: team_id, player_id: player_id, season_id: last_season_id)
        end
      end
    redirect_to edit_day_path(@day.id)
  end

  def edit; end

  def update
    params[:day][:day_players_attributes].values
      .select { |x| @day.day_players.find { |xx| xx.id == x["id"].to_i }.player_id != x["player_id"].to_i }
      .each do |x|
        player = Player.find_by(id: x['player_id'])
        DayPlayer.find_by(id: x['id']).update(player_id: player.id, elo: player.elo)
      end
  end

  def next
    @messages = Message.where(chat_id: ENV['CHAT_NAME']).where.not(text: nil).order(created_at: :asc).last(20)
    @current_player_messages = @messages.select { |msg| msg.uid == current_player.uid.to_i } if current_player
  end

  private

  def players_list
    @players_list = @players_mapa = @players.map { |x| ["#{x.id.to_s.rjust(2, '0')}: #{x.short_name}", x.id] }.sort
  end

  def sorted_hash(group)
    group.map { |k, v| [k, v.length] if k }
         .compact
         .sort_by { |player, count| [-count, player] }
         .to_h
  end

  def load_players
    @players = Player.all.to_a
  end

  def find_day
    @day = params[:id] ? Day.find_by(id: params[:id]) : Day.last
    @day ||= Day.find_by(id: params[:id].to_i + params[:to].to_i)
  end

  def find_games
    @games = @day.games.order(id: :asc)
  end

  def ordering
    params[:sort].in?(%w[stats_elo days games win draw lose goals_count assists_count goals_day_count assists_day_count]) ? params[:sort] : 'stats_elo' # 'goals_day_count'
  end
end
