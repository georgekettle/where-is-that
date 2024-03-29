class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  has_one_attached :photo
  
  has_person_name
  has_many :boards, class_name: "Board", foreign_key: :owner_id, dependent: :destroy
  has_many :pins, through: :boards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def formatted_username
    "@#{username}"
  end
end
