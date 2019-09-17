class Team < ApplicationRecord
  belongs_to :user
  has_many :students
  accepts_nested_attributes_for :students

  def registered?
    registered
  end

  after_initialize do
    id = Team.createIdentifier
    while Team.find_by(team_identifier: id) != nil
      id = Team.createIdentifier
    end
    self.team_identifier = id
  end

  def self.createIdentifier
    charset = Array('A'..'Z')
    Array.new(3) { charset.sample }.join
  end

end
