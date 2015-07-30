class AddImageToMagazine < ActiveRecord::Migration
  def change
    add_column :magazines, :image, :string
  end
end
