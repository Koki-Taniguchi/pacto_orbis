class Order < ApplicationRecord
  belongs_to :user

  has_many :order_details
  validates :payment, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  NOW_POSTAGE = 500
  NOW_POSTAGE.freeze

  enum select_status: {
    "受付" => 0,
    "商品準備中" => 1,
    "出荷済" => 2,
  }

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
