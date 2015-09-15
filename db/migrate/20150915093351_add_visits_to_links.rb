class AddVisitsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visits, :integer
    add_column :links, :default, :0
  end
end
