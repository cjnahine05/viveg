class Addmagazinemerchantid < ActiveRecord::Migration
  def change
    add_reference :magazines, :merchant, index: true
  end
end
