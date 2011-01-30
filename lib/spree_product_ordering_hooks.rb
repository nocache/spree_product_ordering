class SpreeProductOrderingHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_product_sub_tabs,   'admin/hooks/sub_menu_tab'
end
