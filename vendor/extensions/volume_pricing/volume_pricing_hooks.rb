class VolumePricingHooks < Spree::ThemeSupport::HookListener

  # adding new tab to the admin navigation
  insert_after :admin_tabs do
    '<%= tab :channels %>'
  end
  
  insert_after :admin_product_tabs, :partial => "admin/shared/vp_product_tab"

  insert_after :admin_variant_edit_form, :partial => "admin/variants/edit_fields"
end
