class AddColumnToRacecarTable < ActiveRecord::Migration[5.2]
  def change
    add_column :racecars, :bio, :text
  end
end
