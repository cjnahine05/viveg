class AdminController < ApplicationController
  before_action :authenticate_admin!
  def index
    @api_key = ApiKey.all
  end
end
