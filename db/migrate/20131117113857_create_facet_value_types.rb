class CreateFacetValueTypes < ActiveRecord::Migration
  def change
    create_table :facet_value_types do |t|

      t.timestamps
    end
  end
end
