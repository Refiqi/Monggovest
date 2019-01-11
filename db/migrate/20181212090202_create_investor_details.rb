class CreateInvestorDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :investor_details do |t|
      t.references :user_investor, index: true, foreign_key: true
      t.string :id_card_number
      t.string :addres
      t.string :phone_number
      t.date :birth_date

      t.timestamps
    end
  end
end
