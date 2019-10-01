class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    change_table :trials do |t|
      t.remove :ballot_1_id
      t.remove :ballot_2_id
      t.references :ballot_1, class_name: 'Ballot'
      t.references :ballot_2, class_name: 'Ballot'
    end
  end
end
