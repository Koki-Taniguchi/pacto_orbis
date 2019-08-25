class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  belongs_to :label

  has_many :disks
  has_many :cart_items
  has_many :order_details
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true

  scope :search_artist, ->(search) { joins(:artist).where("artists.name LIKE :search", search: "%#{search}%")}
  scope :search_genre, ->(search) { joins(:genre).where("genres.name LIKE :search", search: "%#{search}%")}
  scope :search_label, ->(search) { joins(:label).where("labels.name LIKE :search", search: "%#{search}%")}

  attachment :jacket_image

  TAX = 1.08
  TAX.freeze

  enum select_status: {
    "販売中": true,
    "売り切れ": false
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

  def self.search(search)
    ids = where("title LIKE :search", search: "%#{search}%").pluck(:id) +
    search_artist(search).pluck(:id) +
    search_genre(search).pluck(:id) +
    search_label(search).pluck(:id)

    Item.where(id: ids.uniq)
  end
end
