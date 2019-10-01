class CreateBallots < ActiveRecord::Migration[5.1]
  def change
    create_table :ballots do |t|
      t.belongs_to :trial
      t.integer :p_points
      t.integer :d_points
      t.belongs_to :attorney_1, class_name: 'Student'
      t.belongs_to :attorney_2, class_name: 'Student'
      t.belongs_to :attorney_3, class_name: 'Student'
      t.belongs_to :witness_1, class_name: 'Student'
      t.belongs_to :witness_2, class_name: 'Student'
      t.belongs_to :witness_3, class_name: 'Student'
      t.timestamps
    end
  end
end
