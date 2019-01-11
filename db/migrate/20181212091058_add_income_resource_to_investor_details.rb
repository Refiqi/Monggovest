class AddIncomeResourceToInvestorDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :investor_details, :income_resource, :integer
  end
end
