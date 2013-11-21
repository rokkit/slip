ActiveAdmin.register Product do

  show do |product|
    attributes_table do
      row :name
      row :content
      row :user
      row "Параметры" do
        ul do
          product.facets.each do |facet|
            li "#{facet.name} - #{facet.facet_values.first.value }"
          end
        end
      end
      row "Фотографии" do
          ul do
            product.photos.each do |photo|
              li image_tag photo.photo.url(:main)
            end
          end
      end
    end
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :user
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
