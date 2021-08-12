class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string      :zip_code,        null: false
      t.integer     :prefectures_id,  null: false
      t.string      :municipality,    null: false
      t.string      :street_address,  null: false
      t.string      :building_name
      t.string      :phone_number,    null: false
      t.references  :order,           foreign_key: true
      t.timestamps
    end
  end
end
