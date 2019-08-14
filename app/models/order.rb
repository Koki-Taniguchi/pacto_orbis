class Order < ApplicationRecord
  belongs_to :user

  has_many :order_details

  def display_status
    if status == 0
      '受付'
    elsif status == 1
      '商品準備中'
    else
      '出荷済み'
    end
  end

  def display_payment
    if payment == 0
      '代引'
    else
      '銀行振込'
    end
  end
end
