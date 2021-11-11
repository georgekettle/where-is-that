class Pin < ApplicationRecord
  belongs_to :location
  has_many :saves, dependent: :destroy
end
