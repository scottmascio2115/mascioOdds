class Game < ActiveRecord::Base
  belongs_to :away_team, class_name: 'Team'
  belongs_to :home_team, class_name: 'Team'

  def self.generate_scores
    Game.all.each do |g|
      home_team = g.home_team
      away_team = g.away_team

      [home_team, away_team].each do |t|
        t.build_confidence_score
        t.set_home_away_points
        t.set_spread_points
        t.set_over_under_points
        t.set_streak_points
        t.win_points
        t.loss_points
        t.set_divion_points
        t.rookie_qbs
        t.confidence_score.score += 100
        t.save
      end
    end
  end

  def calculate_overall_score
    percentage = percentage(over_under)
    score = (home_team.confidence_score.score - away_team.confidence_score.score).abs
    adjusted_percentage = score - ((score) * percentage)
  end

  def favorite
    home_team.confidence_score.score > away_team.confidence_score.score ? home_team.name : away_team.name
  end

  private

  def percentage(over_under)
    case over_under
    when 30..40
      0.05
    when 40..50
      0.10
    when 50..60
      0.20
    when 60..70
      0.30
    else
      1
    end
  end
end
