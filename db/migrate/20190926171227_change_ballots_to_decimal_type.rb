class ChangeBallotsToDecimalType < ActiveRecord::Migration[5.1]
  def up
    change_column :teams, :ballots, :decimal
  end
  
  def down
    change_column :teams, :ballots, :integer
  end
end
