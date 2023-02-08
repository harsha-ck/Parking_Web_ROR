class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :spots
      t.integer :vtype
      t.boolean :status

      t.timestamps
    end
  end
end
