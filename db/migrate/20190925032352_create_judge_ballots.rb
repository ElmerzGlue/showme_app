class CreateJudgeBallots < ActiveRecord::Migration[5.1]
  def change
    create_table :judge_ballots do |t|
      t.boolean :p_won
      t.belongs_to :trial
      t.belongs_to :attorney_1, class_name: 'Student'
      t.belongs_to :attorney_2, class_name: 'Student'
      t.belongs_to :attorney_3, class_name: 'Student'
      t.belongs_to :witness_1, class_name: 'Student'
      t.belongs_to :witness_2, class_name: 'Student'
      t.belongs_to :witness_3, class_name: 'Student'
      t.timestamps
    end
    change_table :trials do |t|
      t.belongs_to :ballot_1, class_name: 'Ballot'
      t.belongs_to :ballot_2, class_name: 'Ballot'
      t.belongs_to :judge_ballot
    end
  end
end
