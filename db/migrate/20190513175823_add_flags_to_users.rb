class AddFlagsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :paid_registration, :boolean
    add_column :users, :paid_tournament, :boolean
  end
end
