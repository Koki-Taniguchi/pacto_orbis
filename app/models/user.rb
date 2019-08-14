class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, length: { in: 1..15 }, format: { with: /\A\p{blank}*[^\p{katakana}\p{blank}ｧ-ﾝﾞﾟ]+\p{blank}*\z/ }
  validates :first_name, presence: true, length: { in: 1..15 }, format: { with: /\A\p{blank}*[^\p{katakana}\p{blank}ｧ-ﾝﾞﾟ]+\p{blank}*\z/ }
  validates :kana_last_name, presence: true, length: { in: 1..15 }, format: { with: /\A\p{blank}*[\p{katakana}ー]+\p{blank}*\z/ }
  validates :kana_first_name, presence: true, length: { in: 1..15 }, format: { with: /\A\p{blank}*[\p{katakana}ー]+\p{blank}*\z/ }
  validates :phone, presence: true, length: { in: 10..11 }, numericality: { only_integer: true }
  validates :postal_code, presence: true, length: { in: 5..9 }, format: { with: /\A\w+\z/ }
  validates :address, presence: true

  has_many :cart_items
  has_many :addresses
  has_many :orders

  def active_for_authentication?
    super && !is_deleted
  end
end
