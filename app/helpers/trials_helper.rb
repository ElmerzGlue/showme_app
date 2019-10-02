module TrialsHelper
    def getOptions
        arr = Array.new
        Team.find_each do |t|
            body = t.user.school + " - " + t.team_identifier
            value = t.id.to_s
            arr.push(Array[body, value])
        end
        return arr
    end

    def getStudentsForTrial(trial)
        arr = Array.new
        trial.p_team.students.find_each do |student|
            arr.push(Array[student.name + " (P)", student.id])
        end
        trial.d_team.students.find_each do |student|
            arr.push(Array[student.name + " (D)", student.id])
        end
        return arr
    end
end