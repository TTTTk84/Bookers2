class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :book, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

end
