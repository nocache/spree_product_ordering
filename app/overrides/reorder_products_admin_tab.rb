Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "reorder_products_admin_tab",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :text => "<%= tab :reorder, :route => 'admin_reorder_products', :match_path => '/reorder_products' %>")