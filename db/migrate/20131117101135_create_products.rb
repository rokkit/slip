class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
