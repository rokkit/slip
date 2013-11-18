class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.string :name
      t.references :product, index: true

      t.timestamps
    end
  end
end
