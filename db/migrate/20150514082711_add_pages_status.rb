class AddPagesStatus < ActiveRecord::Migration
  def change
    add_column :pages ,:status, :boolean
  end
end
