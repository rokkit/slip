class Facet < ActiveRecord::Base
  has_many :facet_values
  accepts_nested_attributes_for :facet_values, allow_destroy: true
end
