class CreateConfidenceScores < ActiveRecord::Migration
  def change
    create_table :confidence_scores do |t|
      t.integer :team_id
      t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end
