class CreateProductParametersProduct < ActiveRecord::Migration
  def change
    create_table :facets_products, :id => false do |t|
        t.references :facet, :null => false
        t.references :product, :null => false
    end
    add_index(:facets_products, [:facet_id, :product_id], :unique => true)
  end
end
