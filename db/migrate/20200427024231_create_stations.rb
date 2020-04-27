class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :route
      t.integer :name
      t.integer :time
      t.integer :build_id

      t.timestamps
    end
  end
end
