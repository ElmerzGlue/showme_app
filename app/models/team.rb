class Team < ApplicationRecord
  belongs_to :user
  has_many :students

  def registered?
    registered
  end
end
