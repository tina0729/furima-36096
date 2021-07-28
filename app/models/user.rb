class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true  
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} 
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/} 
  validates :birth, presence: true
  validates :encrypted_password,:password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}

  has_many :products
  has_many :orders
end
