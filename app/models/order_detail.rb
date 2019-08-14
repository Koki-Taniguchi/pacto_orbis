class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def total_price
    cd_price * cd_amount
  end
end
