class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :work_orders
  has_many :locations, through: :work_orders

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  # validates :username, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
