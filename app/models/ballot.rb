class Ballot < ApplicationRecord
    belongs_to :attorney_1, class_name: 'Student', optional: true
    belongs_to :attorney_2, class_name: 'Student', optional: true
    belongs_to :attorney_3, class_name: 'Student', optional: true
    belongs_to :witness_1, class_name: 'Student', optional: true
    belongs_to :witness_2, class_name: 'Student', optional: true
    belongs_to :witness_3, class_name: 'Student', optional: true

    def trial
        Trial.where("ballot_1_id = ? OR ballot_2_id = ?", self.id, self.id).first
    end

    def finished
        self.attorney_1 && self.attorney_2 && self.attorney_3 && self.witness_1 && self.witness_2 && self.witness_3 && self.p_points && self.d_points
    end

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

        if self.p_points > self.d_points
            self.trial.p_team.update_attribute(:ballots, self.trial.p_team.ballots + 1)
        elsif self.d_points > self.p_points
            self.trial.d_team.update_attribute(:ballots, self.trial.d_team.ballots + 1)
        elsif self.p_points == self.d_points
            if self.tiebreaker_p_won
                self.trial.p_team.update_attribute(:ballots, self.trial.p_team.ballots + 1)
            else
                self.trial.d_team.update_attribute(:ballots, self.trial.d_team.ballots + 1)
            end
        end

        self.trial.p_team.update_attribute(:points, self.trial.p_team.points + self.p_points)
        self.trial.d_team.update_attribute(:points, self.trial.d_team.points + self.d_points)

        self.trial.p_team.update_attribute(:point_differential, self.trial.p_team.point_differential + (self.p_points - self.d_points))
        self.trial.d_team.update_attribute(:point_differential, self.trial.d_team.point_differential + (self.d_points - self.p_points))

        self.attorney_1.save
        self.attorney_2.save
        self.attorney_3.save
        self.witness_1.save
        self.witness_2.save
        self.witness_3.save
    end
end
