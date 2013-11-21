ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    
    


    # Here is an example of a simple dashboard with columns and panels.
    
    columns do
      column do
        panel "Новые продукты" do
          ul do
            Product.limit(5).map do |product|
              li raw("#{link_to(product.name, admin_product_path(product))}, #{product.created_at_format}")
            end
          end
        end
      end

      column do
        panel "Новые клиенты" do
          ul do
            User.limit(5).map do |user|
              li raw("#{link_to(user.name, admin_user_path(user))}, #{user.created_at}")
            end
          end
        end
      end
    end
  end # content
end
