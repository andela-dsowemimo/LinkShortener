class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :browser
      t.string :location

      t.timestamps null: false
    end
  end
end
