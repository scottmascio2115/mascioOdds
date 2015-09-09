class TeamsController < ApplicationController

  before_action :set_team, except: [:index, :new, :create]

  def index
    @teams = Team.order(games_won: :desc)
  end

  def edit

  end

  def update
    @team.update_attributes(team_params)

    respond_with @team, location: teams_path
  end

  private

  def team_params
    params.require(:team).permit(:game_id, :name, :division, :games_won, :games_lost, :streak, :home, :spread)
  end

  def set_team
    @team ||= Team.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Team not found"
    redirect_to root_path
  end

end
