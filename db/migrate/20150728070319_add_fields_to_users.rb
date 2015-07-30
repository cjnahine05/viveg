class AddFieldsToUsers < ActiveRecord::Migration
  def change

    add_column :merchants, :company_name, :string
    add_column :merchants, :representative, :string
    add_column :merchants, :contact_number, :integer
    add_column :merchants, :address, :string

  end
end
