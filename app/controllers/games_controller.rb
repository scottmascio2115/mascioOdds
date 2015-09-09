class GamesController < ApplicationController

  before_action :set_game, except: [:index, :create, :new]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save

    respond_with @game, location: games_path
  end

  def update
    @game.update_attributes(game_params)

    respond_with @game, location: games_path
  end

  def edit

  end

  def destroy
    @game.destroy

    respond_with @game, location: games_path
  end

  private

  def game_params
    params.require(:game).permit(:home_team_id, :away_team_id, :over_under, :divison_game)
  end

  def set_game
    @game ||= Game.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Game not found"
    redirect_to root_path
  end
end
