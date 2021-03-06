class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

=begin
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end 
=end

end
