class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: '6文字以上の半角英数字'
    validates :firstname, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :lastname, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :firstname_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :lastname_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :password, confirmation: true
    validates :nickname
    validates :birthday
  end
end
