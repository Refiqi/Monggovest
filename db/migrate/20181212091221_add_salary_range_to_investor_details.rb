class AddSalaryRangeToInvestorDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :investor_details, :salary_range, :integer
  end
end
