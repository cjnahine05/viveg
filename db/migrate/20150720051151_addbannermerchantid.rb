class Addbannermerchantid < ActiveRecord::Migration
  def change
    add_reference :banners, :merchant, index: true
  end
end
