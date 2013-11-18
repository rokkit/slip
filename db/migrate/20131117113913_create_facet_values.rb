class CreateFacetValues < ActiveRecord::Migration
  def change
    create_table :facet_values do |t|
      t.string :value
      t.references :facet_value_type, index: true
      t.references :facet, index: true
      
      t.timestamps
    end
  end
end
