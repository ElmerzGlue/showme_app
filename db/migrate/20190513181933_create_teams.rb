class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :teams
    end

    create_table :teams do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.timestamps
    end

    create_table :students do |t|
      t.belongs_to :team, index: true, foreign_key: true
      t.string :name
    end

  end

end
