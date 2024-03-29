class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :phone, presence: true

  has_one_attached :avatar

  has_many :address

  enum role: { user: 'user', admin: 'admin' }
  # enum role: ['user', 'admin']
end
