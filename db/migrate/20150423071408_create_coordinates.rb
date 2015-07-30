class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.references :page, index: true, foreign_key: true
      t.string :product_name
      t.string :coordinates

      t.timestamps null: false
    end
  end
end
