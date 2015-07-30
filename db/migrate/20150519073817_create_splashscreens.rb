class CreateSplashscreens < ActiveRecord::Migration
  def change
    create_table :splashscreens do |t|
      t.string :name
      t.string :video

      t.timestamps null: false
    end
  end
end
