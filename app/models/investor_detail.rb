class InvestorDetail < ApplicationRecord
  belongs_to :user_investor
  has_one :user, through: :user_investor
  enum id_card_type: %i[KTP SIM NPWP]
  enum income_resource: %i[Gaji Hasilusaha Tabungan Warisan Lainnya]
  enum salary_range: [:"Rp 1.000.000,00 - Rp 4.999.999,00", :"Rp 5.000.000,00 - Rp 9.999.999,00", :"Rp 10.000.000,00 - Rp 19.999.999,00", :"Rp 20.000.000,00 - Rp 49.999.999,00", :"Rp 50.000.000,00 ke atas"]
end
