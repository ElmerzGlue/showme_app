class Team < ApplicationRecord
  belongs_to :user
  has_many :students
  accepts_nested_attributes_for :students

  def registered?
    registered
  end
end
