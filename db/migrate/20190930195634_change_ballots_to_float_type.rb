class ChangeBallotsToFloatType < ActiveRecord::Migration[5.1]
  def up
    change_column :teams, :ballots, :float
  end

  def down
    change_column :teams, :ballots, :decimal
  end
end
