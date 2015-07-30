class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :magazine, index: true, foreign_key: true
      t.integer :page_number
      t.string :image

      t.timestamps null: false
    end
  end
end
