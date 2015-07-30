class Addbannerstatus < ActiveRecord::Migration
  def change
    add_column :banners , :status , :boolean
  end
end
