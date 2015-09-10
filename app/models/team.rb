class Team < ActiveRecord::Base
  default_scope { order('games_won DESC') }

  has_one :game
  has_one :confidence_score

  scope :nfc_west, -> { where(division: 'NFC West') }
  scope :nfc_south, -> { where(division: 'NFC South') }
  scope :nfc_north, -> { where(division: 'NFC North') }
  scope :nfc_east, -> { where(division: 'NFC East') }

  scope :afc_west, -> { where(division: 'AFC West') }
  scope :afc_south, -> { where(division: 'AFC South') }
  scope :afc_north, -> { where(division: 'AFC North') }
  scope :afc_east, -> { where(division: 'AFC East') }

  def self.consistent_name
    jets = self.find_by(name: "New York Jets  ")
    giants = self.find_by(name: "New York Giants  ")
    giants.update_attribute(:name, "NY Giants") if giants
    jets.update_attribute(:name, "NY Jets") if jets
  end

  def remove_spaces
    name.delete(' ')
  end

  def record
    "#{games_won} - #{games_lost}"
  end

  def set_home_away_points
    points = 7 if home?
    confidence_score.score += points if points
  end

  def set_spread_points
    points = ((spread * -1) * 2)
    confidence_score.score += points if points
  end

  def set_over_under_points
    points = (game.over_under * 0.3333)
    confidence_score.score += points if points
  end

  def set_streak_points
    points = (streak * 2)
    confidence_score.score += points if points
  end

  def win_points
    points = (games_won * 2)
    confidence_score.score += points if points
  end

  def loss_points
    points = (games_lost * 2)
    confidence_score.score -= points if points
  end

  def set_divion_points
    points = 21 if game.divison_game?
    confidence_score.score -= points if points
  end
end
