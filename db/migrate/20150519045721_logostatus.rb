class Logostatus < ActiveRecord::Migration
  def change
    add_column :logos , :status , :boolean
  end
end
