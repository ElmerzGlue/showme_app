class AddCourtroomArtistToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :courtroom_artist, :string
    add_column :teams, :registered, :boolean, default: false
  end
end
