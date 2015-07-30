class ImageMappingController < ApplicationController
  layout "image_mapping_layout"
  before_action :authenticate_admin!
  def index
    @pages = Page.all
  end
end
