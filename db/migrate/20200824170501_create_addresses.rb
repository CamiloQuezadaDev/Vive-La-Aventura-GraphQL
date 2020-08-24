class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.float :lat
      t.float :lng
      t.string :city
      t.string :locality
      t.string :line1
      t.references :subsidiary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
