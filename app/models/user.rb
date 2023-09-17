class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: { message: "can't be blank" }

  validates :email, presence: { message: "can't be blank" }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: { message: "can't be blank" }, format: { with: PASSWORD_REGEX, message: "is invalid. Include both letters and numbers" }

  validates :last_name, presence: { message: "can't be blank" }, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }

  validates :first_name, presence: { message: "can't be blank" }, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }

  validates :last_name_kana, presence: { message: "can't be blank" }, format: { with: /\A[ァ-ヶ]+\z/, message: "invalid. Input full-width katakana characters" }

  validates :first_name_kana, presence: { message: "can't be blank" }, format: { with: /\A[ァ-ヶ]+\z/, message: "invalid. Input full-width katakana characters" }

  validates :birthday, presence: { message: "can't be blank" }

end
