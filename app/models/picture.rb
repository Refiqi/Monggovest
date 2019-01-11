class Picture < ApplicationRecord
  belongs_to :product
  mount_uploader :photo, PhotoUploader
  has_many :product_invests, through: :product
end
