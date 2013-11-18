class AddPhotoToProductPhotos < ActiveRecord::Migration
  def change
    add_column :product_photos, :photo, :string
  end
end
