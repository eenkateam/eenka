class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true
  validates :postal_code, length: { is: 7}, presence: true
  validates :adress, presence: true
  validates :phone_number, length: { in: 10..11}, presence: true, uniqueness: true

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :receivers, dependent: :destroy
end
