class CreateTableRacecars < ActiveRecord::Migration[5.2]
  def change
    create_table :racecars do |t|
      t.string :name
      t.integer :horsepower
    end
  end
end
