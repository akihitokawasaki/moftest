class CreateBuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :builds do |t|
      t.string :name
      t.integer :rent
      t.string :address
      t.integer :age
      t.text :remark

      t.timestamps
    end
  end
end
