class AddUserEmailFirstNameLastNameUsers < ActiveRecord::Migration
  def change
    add_index :users, [:email,:first_name,:last_name]
  end
end
