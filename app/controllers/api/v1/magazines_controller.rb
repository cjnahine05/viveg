module Api
  module V1
    class MagazinesController < ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      before_filter :restrict_access

      respond_to :json

      def index
        respond_with Magazine.find_by_sql("select magazines.id ,magazines.name,magazines.created_at,magazines.updated_at,magazines.image,magazines.start_date,magazines.end_date,magazines.title,magazines.category,magazines.bar_code,magazines.month,magazines.year,magazines.status,magazines.row_order from magazines where  status=true order by row_order asc")
      end

      def magazine_updated_at
        respond_with Magazine.find_by_sql("select magazines.id ,magazines.name,magazines.created_at,magazines.updated_at,magazines.image,magazines.start_date,magazines.end_date,magazines.title,magazines.category,magazines.bar_code,magazines.month,magazines.year,magazines.status,magazines.row_order from magazines where updated_at > '#{params[:updated_at]}' and  status=true order by row_order asc")
      end

      def show
        respond_with Magazine.find(params[:id])
      end

      def create
        respond_with Magazine.create(params[:magazine])
      end

      def update
        respond_with Magazine.update(params[:id], params[:magazine])
      end

      def destroy
        respond_with Magazine.destroy(params[:id])
      end

      private

      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end


    end
  end
end