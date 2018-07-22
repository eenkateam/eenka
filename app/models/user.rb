class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, length: { in: 2..20}, presence: true, uniqueness: true
  validates :last_name, length: { in: 2..20}, presence: true, uniqueness: true
  validates :first_kana, length: { in: 2..20}, presence: true, uniqueness: true
  validates :last_kana, length: { in: 2..20}, presence: true, uniqueness: true
  validates :postal_code, length: { is: 7}, presence: true
  validates :adress, length: { in: 2..50}, presence: true
  validates :phone_number, length: { in: 10..11}, presence: true, uniqueness: true

  has_one :cart
  has_many :orders
  has_many :receivers
end
