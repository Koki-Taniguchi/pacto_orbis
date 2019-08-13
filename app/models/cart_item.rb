class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def total_price
    item.price * amount
  end
end
