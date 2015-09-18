class AddUsersToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :users, :string, after: :location
  end
end
