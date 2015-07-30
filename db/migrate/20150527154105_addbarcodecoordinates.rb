class Addbarcodecoordinates < ActiveRecord::Migration
  def change
    add_column :coordinates , :barcode , :string
  end
end
