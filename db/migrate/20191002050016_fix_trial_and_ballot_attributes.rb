class FixTrialAndBallotAttributes < ActiveRecord::Migration[5.1]
  def change
    add_column :ballots, :tiebreaker_p_won, :boolean
    add_column :teams, :wins, :integer, default: 0
    add_column :teams, :losses, :integer, default: 0
    add_column :trials, :round, :integer, default: 1
    reversible do |migrate|
      migrate.up do
        change_column :teams, :ballots, :integer
      end
      migrate.down do
        change_column :teams, :ballots, :float
      end
    end
  end
end
