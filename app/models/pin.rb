class Pin < ApplicationRecord
  belongs_to :location
  has_many :saves, dependent: :destroy
  has_many_attached :photos
end
