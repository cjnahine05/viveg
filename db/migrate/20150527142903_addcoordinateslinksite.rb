class Addcoordinateslinksite < ActiveRecord::Migration
  def change
    add_column :coordinates , :site_link ,:string
  end
end
