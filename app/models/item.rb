class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label

  has_many :disks
  has_many :cart_items
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true

  attachment :jacket_image

  enum select_status: {
    on_sale: true,
    sold_out: false
  }

  def first_song
    disks.first.songs.first
  end

  def statuses
    if status
      '販売中'
    else
      '売り切れ'
    end
  end

end
