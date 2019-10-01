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
end