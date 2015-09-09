class ConfidenceScoresController < ApplicationController

  def index
    @teams = Team.includes(:confidence_score).order('confidence_scores.score desc')
  end

  def generate_scores
    @games = Game.generate_scores

    respond_with @games, location: confidence_scores_path
  end
end
