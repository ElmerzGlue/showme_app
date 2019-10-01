class TrialValidator < ActiveModel::Validator
    def validate(trial)
        if trial.p_team == trial.d_team
            trial.errors[:p_team] << "cannot be the same as defense team"
        end
    end
end

class Trial < ApplicationRecord
    belongs_to :p_team, class_name: 'Team'
    belongs_to :d_team, class_name: 'Team'
    belongs_to :ballot_1, class_name: 'Ballot'
    belongs_to :ballot_2, class_name: 'Ballot'
    belongs_to :judge_ballot, class_name: 'JudgeBallot'

    validates :p_team, presence: true
    validates :d_team, presence: true

    validates_with TrialValidator

    before_validation do
        self.ballot_1 = Ballot.create unless self.ballot_1
        self.ballot_2 = Ballot.create unless self.ballot_2
        self.judge_ballot = JudgeBallot.create unless self.judge_ballot
    end

    def score
        if self.ballot_1.finished && self.ballot_2.finished && self.judge_ballot.finished && !self.scored
            self.ballot_1.score
            self.ballot_2.score
            self.judge_ballot.score
            self.scored = true
            self.save
            return true
        end
        false
    end
end