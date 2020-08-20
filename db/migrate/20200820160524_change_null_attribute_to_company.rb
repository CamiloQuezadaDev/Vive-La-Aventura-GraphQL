class ChangeNullAttributeToCompany < ActiveRecord::Migration[6.0]
  def change
    if Company.any? 
      Company.all.each do |company| 
        company.update(service_id: Service.first.id)
      end
    end

    change_column_null :companies, :service_id, false 
  end
end
