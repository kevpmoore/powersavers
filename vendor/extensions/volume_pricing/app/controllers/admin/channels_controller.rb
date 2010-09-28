class Admin::ChannelsController < Admin::BaseController
  resource_controller
  before_filter :load_data, :only => [:new, :edit, :create]

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

  private

  def load_data
    @channel_users = User.all(:joins => "JOIN roles_users r ON r.user_id = users.id",
      :conditions => ["role_id = ?", 3])
  end
end
