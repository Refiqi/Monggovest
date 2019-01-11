class Subdistrict < ApplicationRecord
  belongs_to :regional
  has_one :province, through: :regional
  has_many :products, dependent: false
end
