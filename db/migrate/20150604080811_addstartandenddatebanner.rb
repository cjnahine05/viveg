class Addstartandenddatebanner < ActiveRecord::Migration
  def change
    add_column :banners , :start_date , :datetime
    add_column :banners , :end_date , :datetime
  end
end
