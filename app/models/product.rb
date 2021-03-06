class Product < ActiveRecord::Base
  belongs_to :user
  has_many :photos, class_name: "ProductPhoto", dependent: :destroy
  has_and_belongs_to_many :facets
  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :facets, allow_destroy: true

  
  searchable do
    text :name, :boost => 5
    text :content, :boost => 4
    text :facets do
      facets.map(&:name)
    end
    text :facets_values do
      facets.map { |facet| facet.facet_values.map {|fv| fv.value } }
    end
  end
  
  
  def created_at_format
    self.created_at.strftime("%d.%m.%Y %R")
  end
  
end
