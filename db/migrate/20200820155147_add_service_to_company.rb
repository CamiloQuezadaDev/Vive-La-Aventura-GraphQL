class AddServiceToCompany < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :service, null: true , foreign_key: true
  end
end
