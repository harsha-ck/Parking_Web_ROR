class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :vnum
      t.string :vtype
      t.datetime :entry
      t.datetime :exit
      t.float :price
      t.string :spots
      t.references :spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
