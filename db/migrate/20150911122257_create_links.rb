class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :full_link_address
      t.string :shortened_link_address

      t.timestamps null: false
    end
  end
end
