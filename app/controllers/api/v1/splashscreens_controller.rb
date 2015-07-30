module Api
  module V1
    class SplashscreensController < ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      before_filter :restrict_access

      respond_to :json

      def index
        respond_with Splashscreen.all
      end

      def show
        respond_with Splashscreen.find(params[:id])
      end

      def create
        respond_with Splashscreen.create(params[:video])
      end

      def update
        respond_with Splashscreen.update(params[:id], params[:video])
      end

      def destroy
        respond_with Splashscreen.destroy(params[:id])
      end

      private

      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end


    end
  end
end