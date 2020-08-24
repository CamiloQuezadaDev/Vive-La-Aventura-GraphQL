class CreateSubsidiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :subsidiaries do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
