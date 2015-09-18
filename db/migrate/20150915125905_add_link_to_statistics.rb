class AddLinkToStatistics < ActiveRecord::Migration
  def change
    add_reference :statistics, :link, index: true, foreign_key: true
  end
end
