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
  validates :first_kana,
                  format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "を全角カタカナのみで入力して下さい"
                 }
  validates :last_kana,
                  format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "を全角カタカナのみで入力して下さい"
                 }
  validates :postal_code, length: { is: 7},numericality: { only_integer: true,message: "を数字のみで入力してください" }
  validates :adress, presence: true
  validates :phone_number, length: { in: 10..11}, uniqueness: true,numericality: { only_integer: true,message: "を数字のみで入力してください" }
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :receivers, dependent: :destroy
end
