class AddColumnsToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :value, :integer
    add_column :votes, :user_id, :integer
  end
end
