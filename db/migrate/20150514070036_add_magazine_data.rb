class AddMagazineData < ActiveRecord::Migration

    def change
      add_column :magazines , :start_date , :date
      add_column :magazines , :end_date , :date
      add_column :magazines , :title , :text
      add_column :magazines , :category , :text
      add_column :magazines , :bar_code , :text
      add_column :magazines , :month , :text
      add_column :magazines , :year , :text
    end

end
