class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  validates :email, presence: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }


end
