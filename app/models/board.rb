class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :saves, dependent: :destroy
  has_many :pins, through: :saves
end
