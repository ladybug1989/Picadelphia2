class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
