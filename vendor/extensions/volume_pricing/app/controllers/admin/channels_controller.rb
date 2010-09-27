class Admin::ChannelsController < Admin::BaseController
  resource_controller
  before_filter :load_data, :only => [:new, :edit]

  def index
    @channels = Channel.paginate(:all,
      :order => 'name',
      :page => params[:page])    
  end

  create.response do |wants|
    wants.html { redirect_to collection_url }
  end

  update.response do |wants|
    wants.html { redirect_to collection_url }
  end

#  def consignments
#    @consignments = Consignment.find(:all,
#      :conditions => {:consignor_id => params[:id]},
#      :include => :products,
#      :order => 'consignments.id, products.name')
#    @consignor = Consignor.find(params[:id])
#  end

  def remove_consignment
    product = Product.find(params[:product_id])
    consignment_id = product.consignment_id
    Product.update(params[:product_id], :consignment_id => nil)
    if Product.find_by_consignment_id(consignment_id) == nil
      Consignment.destroy(consignment_id)
    end
  end

  private

  def load_data
#    default_country = Country.find Spree::Config[:default_country_id]
    @channel_users = User.all #has_channels
  end
end
