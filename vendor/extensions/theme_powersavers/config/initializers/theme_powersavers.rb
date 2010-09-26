if Spree::Config.instance
  Spree::Config.set(:stylesheets => 'screen,powersavers')
   Spree::Config.set(:logo => '/images/header.png')
  # Spree::Config.set(:container_bg => '/images/tile-header.png')
end