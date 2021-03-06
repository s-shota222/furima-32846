class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  PASSWORD_REGEX_name = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :first_name,:last_name,  with: PASSWORD_REGEX_name, message: 'は全角（漢字・ひらがな・カタカナ）で設定してください'
  PASSWORD_REGEX_ruby = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :first_name_ruby,:last_name_ruby,  with: PASSWORD_REGEX_ruby, message: 'は全角（カタカナ）で設定してください'

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :encrypted_password 
    validates :first_name 
    validates :last_name
    validates :first_name_ruby
    validates :last_name_ruby
    validates :birthday
  end 

end