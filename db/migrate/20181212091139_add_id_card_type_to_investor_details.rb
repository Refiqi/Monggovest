class AddIdCardTypeToInvestorDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :investor_details, :id_card_type, :integer
  end
end
