class CreateSuperheroTeamPairings < ActiveRecord::Migration
  def change
    create_table :superhero_team_pairings do |t|
      t.references :superhero, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
