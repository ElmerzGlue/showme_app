class Trial < ApplicationRecord
    belongs_to :p_team, class_name: 'Team'
    belongs_to :d_team, class_name: 'Team'
    has_one :ballot_1, class_name: 'Ballot'
    has_one :ballot_2, class_name: 'Ballot'
    has_one :judge_ballot, class_name: 'JudgeBallot'

    validates :p_team, presence: true
    validates :d_team, presence: true

    before_create do
        self.ballot_1 = Ballot.new
        self.ballot_2 = Ballot.new
        self.judge_ballot = JudgeBallot.new
    end

    def score
        if self.ballot_1.save && self.ballot_2.save && self.judge_ballot.save
            self.ballot_1.score
            self.ballot_2.score
            self.judge_ballot.score
            return true
        end
        false
    end
end