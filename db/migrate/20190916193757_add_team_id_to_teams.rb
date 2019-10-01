class AddTeamIdToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :team_identifier, :string, unique: true, null: false, default: "AAA"
    reversible do |dir|
      dir.up{ initializeIdentifiers }
    end
  end

  def initializeIdentifiers
    Team.find_each do |t|
      success = false
      while !success
        begin
          t.team_identifier = createIdentifier
          t.save
          success = true
        rescue => x
        end
      end
    end
  end

end
