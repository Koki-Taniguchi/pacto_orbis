class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label

  has_many :disks
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true

  attachment :jacket_image

  enum statuses: {
    on_sale: true,
    sold_out: false
  }

end
