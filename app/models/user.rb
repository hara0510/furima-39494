class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: { message: "Nickname can't be blank" }

  validates :email, presence: { message: "Email can't be blank" }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: { message: "Password can't be blank" }, format: { with: PASSWORD_REGEX, message: "Password is invalid. Include both letters and numbers" }

  validates :last_name, presence: { message: "Last name can't be blank" }, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Last name is invalid. Input full-width characters" }

  validates :first_name, presence: { message: "First name can't be blank" }, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "First name is invalid. Input full-width characters" }

  validates :last_name_kana, presence: { message: "Last name kana can't be blank" }, format: { with: /\A[ァ-ヶ]+\z/, message: "Last name kana is invalid. Input full-width katakana characters" }

  validates :first_name_kana, presence: { message: "First name kana can't be blank" }, format: { with: /\A[ァ-ヶ]+\z/, message: "First name kana is invalid. Input full-width katakana characters" }

  validates :birthday, presence: { message: "Birth date can't be blank" }

end
