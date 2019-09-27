class JudgeBallot < ApplicationRecord
    belongs_to :trial
    belongs_to :attorney_1, class_name: 'Student'
    belongs_to :attorney_2, class_name: 'Student'
    belongs_to :attorney_3, class_name: 'Student'
    belongs_to :witness_1, class_name: 'Student'
    belongs_to :witness_2, class_name: 'Student'
    belongs_to :witness_3, class_name: 'Student'
    
    def score
        if self.attorney_1.team == self.trial.p_team
            self.attorney_1.p_attorney_ranks += 3
        else
            self.attorney_1.d_attorney_ranks += 3
        end
        if self.attorney_2.team == self.trial.p_team
            self.attorney_2.p_attorney_ranks += 2
        else
            self.attorney_2.d_attorney_ranks += 2
        end
        if self.attorney_3.team == self.trial.p_team
            self.attorney_3.p_attorney_ranks += 1
        else
            self.attorney_3.d_attorney_ranks += 1
        end

        if self.witness_1.team == self.trial.p_team
            self.witness_1.p_witness_ranks += 3
        else
            self.witness_1.d_witness_ranks += 3
        end
        if self.witness_2.team == self.trial.p_team
            self.witness_2.p_witness_ranks += 2
        else
            self.witness_2.d_witness_ranks += 2
        end
        if self.witness_3.team == self.trial.p_team
            self.witness_3.p_witness_ranks += 1
        else
            self.witness_3.d_witness_ranks += 1
        end

        if self.p_won
            self.trial.p_team.ballots += 1
        else
            self.trial.d_team.ballots += 1
        end

        self.p_team.save
        self.d_team.save
        self.attorney_1.save
        self.attorney_2.save
        self.attorney_3.save
        self.witness_1.save
        self.witness_2.save
        self.witness_3.save
    end
end
