module Api
  module V1
    class CoordinatesController < ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      before_filter :restrict_access
      
      respond_to :json


      def index
        respond_with Coordinate.find_by_sql("select coordinates.id as coordinates_id,coordinates.page_id,coordinates.product_name ,coordinates.coordinates from pages left outer join coordinates on coordinates.page_id = pages.id WHERE (page_id IN (#{params[:page_id]})) group by coordinates.id,  coordinates.page_id, coordinates.product_name")
      end

      def show
        respond_with Coordinate.find(params[:id])
      end

      def create
        respond_with Coordinate.create(params[:coordinate])
      end

      def update
        respond_with Coordinate.update(params[:id], params[:coordinate])
      end

      def destroy
        respond_with Coordinate.destroy(params[:id])
      end

      private

      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end


    end
  end
end