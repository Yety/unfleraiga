class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :text_body
      t.integer :user_id
      t.integer :album_id

      t.timestamps
    end
  end
end
