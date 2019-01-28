class InvestorDetail < ApplicationRecord
  # association table
  belongs_to :user_investor
  has_one :product_invest, through: :user_investor
  has_one :product, through: :product_invest
  has_one :product_invest_detail, through: :product_invest
  # to transform integer input to string when showed in form
  enum id_card_type: %i[KTP SIM NPWP]
  enum income_resource: %i[Gaji Hasilusaha Tabungan Warisan Lainnya]
  enum salary_range: [:"Rp 1.000.000,00 - Rp 4.999.999,00", :"Rp 5.000.000,00 - Rp 9.999.999,00", :"Rp 10.000.000,00 - Rp 19.999.999,00", :"Rp 20.000.000,00 - Rp 49.999.999,00", :"Rp 50.000.000,00 ke atas"]
end
