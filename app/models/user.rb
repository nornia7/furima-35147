class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true,
               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                         message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true,
               format: { with: /\A[ァ-ヶー]+\z/,
                         message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

    validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

end
