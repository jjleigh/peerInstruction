class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

  has_many :responses, dependent: :destroy
  has_many :questions, dependent: :destroy

end
