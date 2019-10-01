class FixJudgeBallotReference < ActiveRecord::Migration[5.1]
  def change
    change_table :trials do |t|
      t.remove :judge_ballot_id
      t.references :judge_ballot
    end
  end
end
