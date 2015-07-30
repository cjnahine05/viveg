class Addbannersitelink < ActiveRecord::Migration
  def change
    add_column :banners , :site_link , :string
  end
end
