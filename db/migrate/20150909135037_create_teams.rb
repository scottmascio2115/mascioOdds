class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :game_id
      t.integer :confidence_score_id
      t.string :name
      t.string :division
      t.integer :games_won, default: 0
      t.integer :games_lost, default: 0
      t.integer :streak, default: 0
      t.boolean :home
      t.integer :spread

      t.timestamps null: false
    end
  end
end
