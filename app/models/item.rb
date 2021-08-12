class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :item_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :shipping_date


  with_options presence: true, numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :shipping_date_id
  end

  with_options presence: true do
    validates :item_name
    validates :description
    validates :item_price, inclusion: { in: 300..9999999, message: 'is out of setting range' }, numericality: true
    validates :item_image
  end

end
