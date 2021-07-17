class Item < ApplicationRecord

  belongs_to :user
  has_many_attached :item_images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :shipping_date


  with_options presence: true, 
               numericality: { other_than 0, message: "can't be blank" 
                               } do
    validates :category
    validates :status
    validates :shipping_charges
    validates :shipping_area
    validates :shipping_date
  end

  with_options presence: true do
    validates :item_name
    validates :description
    validates :item_price
  end

end
