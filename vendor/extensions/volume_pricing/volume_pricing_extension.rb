# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class VolumePricingExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/volume_pricing"

  def activate
    Variant.class_eval do 
      has_many :volume_prices, :attributes => true, :order => :position, :dependent => :destroy
      accepts_nested_attributes_for :volume_prices
      
      # calculates the price based on quantity
      def volume_price(quantity)
        volume_prices.each do |price|
          puts price.display
          return price.amount if price.include?(quantity) && price.display.include?('channel1')
#          && price.user = current_userl
        end
        self.price
      end
      
    end
    
    Order.class_eval do
      # override the add_variant functionality so that we can adjust the price based on possible volume adjustment
      def add_variant(variant, quantity=1)
        current_item = contains?(variant)
        price = variant.volume_price(quantity) # Added
        if current_item
          current_item.increment_quantity unless quantity > 1
          current_item.quantity = (current_item.quantity + quantity) if quantity > 1
          current_item.price = price # Added
          current_item.save
        else
          current_item = line_items.create(:quantity => quantity)
          current_item.variant = variant
          current_item.price = price
          current_item.save
        end

        # populate line_items attributes for additional_fields entries
        # that have populate => [:line_item]
        Variant.additional_fields.select{|f| !f[:populate].nil? && f[:populate].include?(:line_item) }.each do |field| 
          value = ""

          if field[:only].nil? || field[:only].include?(:variant)
            value = variant.send(field[:name].gsub(" ", "_").downcase)
          elsif field[:only].include?(:product)
            value = variant.product.send(field[:name].gsub(" ", "_").downcase)
          end
          current_item.update_attribute(field[:name].gsub(" ", "_").downcase, value)
        end
      end
    end

    LineItem.class_eval do
      before_update :check_volume_pricing
      
      private
      def check_volume_pricing
        if changed? && changes.keys.include?("quantity")
          self.price = variant.volume_price(quantity)
        end
      end
    end
    
    String.class_eval do 
     def to_range
       case self.count('.')
         when 2
           elements = self.split('..')
           return Range.new(elements[0].from(1).to_i, elements[1].to_i)
         when 3
           elements = self.split('...')
           return Range.new(elements[0].from(1).to_i, elements[1].to_i-1)
         else
           raise ArgumentError.new("Couldn't convert to Range: #{self}")
       end
     end
    end

#    module Spree::Site::ProductsController
#      def self.included(controller)
#        controller.class_eval do
#          controller.append_before_filter :load_users
#        end
#      end
#
#      def load_users
#        @business_channels = User.all
#      end
#    end

    Admin::ProductsController.class_eval do
      before_filter :load_users
      
      def load_users
#        @tax_categories = TaxCategory.find(:all, :order=>"name")
#        @shipping_categories = ShippingCategory.find(:all, :order=>"name")
        @business_channels = User.all
      end
    end

    Admin::VariantsController.class_eval do
      update.before do
        params[:variant][:volume_price_attributes] ||= {}
      end      
      
      update.response do |wants| 
        wants.html do 
          redirect_to object.is_master ? volume_prices_admin_product_variant_url(object.product, object) : collection_url
        end
      end

      def object 
      	@object ||=  Variant.find(params[:id]) 
      end
      
      def volume_prices
        @variant = object
        @product = @variant.product
      end

    end
  end
  
end