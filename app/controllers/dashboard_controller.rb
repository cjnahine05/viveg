class DashboardController < ApplicationController
  before_action :authenticate_admin!
  def index
    @active_magazines = Magazine.all.where(:status => true,:merchant_id=> nil).count
    @inactive_magazines = Magazine.all.where(:status => false,:merchant_id=> nil).count
    @pages = Page.all.count
  end
end
