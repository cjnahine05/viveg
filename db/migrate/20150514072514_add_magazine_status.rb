class AddMagazineStatus < ActiveRecord::Migration
  def change
    add_column :magazines , :status , :boolean
  end
end
