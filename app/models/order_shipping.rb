class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefectures_id, :municipality, :street_address, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :phone_number, numericality: { only_integer: true, max_length: 11}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(zip_code: zip_code, prefectures_id: prefectures_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end