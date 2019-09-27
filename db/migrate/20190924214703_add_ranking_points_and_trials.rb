class AddRankingPointsAndTrials < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :p_attorney_ranks, :integer, default: 0
    add_column :students, :d_attorney_ranks, :integer, default: 0
    add_column :students, :p_witness_ranks, :integer, default: 0
    add_column :students, :d_witness_ranks, :integer, default: 0
    add_column :teams, :points, :integer, default: 0, null: false
    add_column :teams, :point_differential, :integer, default: 0, null: false
    add_column :teams, :ballots, :integer, default: 0, null: false
    create_table :trials do |t|
      t.belongs_to :p_team, class_name: "Team"
      t.belongs_to :d_team, class_name: "Team"
      t.boolean :scored, default: false
    end
  end
end
