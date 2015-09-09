module GamesHelper

  def game_header(game)
    "#{game.home_team.name} vs. #{game.away_team.name}"
  end
end
