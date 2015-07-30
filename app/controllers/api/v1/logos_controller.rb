module Api
  module V1
    class LogosController < ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      before_filter :restrict_access

      respond_to :json

      def index
        respond_with Logo.all.where(:status=> true)
      end

      def show
        respond_with Logo.find(params[:id])
      end

      def create
        respond_with Logo.create(params[:logo])
      end

      def update
        respond_with Logo.update(params[:id], params[:logo])
      end

      def destroy
        respond_with Logo.destroy(params[:id])
      end

      private

      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end


    end
  end
end