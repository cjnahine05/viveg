class Addcoordiantesproductid < ActiveRecord::Migration
  def change
    add_column :coordinates , :product_id ,:string
  end
end
