class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :camera
      t.string :lens
      t.string :aperture
      t.string :shutter_speed
      t.string :iso
      t.datetime :date_taken

      t.timestamps
    end
  end
end
