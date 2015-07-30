module Api
  module V1
    class BannersController < ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      before_filter :restrict_access

      respond_to :json

      def index
        respond_with @banner_index = Banner.find_by_sql("select banners.id, banners.name, banners.image, banners.created_at, banners.updated_at, banners.status,banners.row_order ,banners.site_link ,banners.start_date,banners.end_date from banners where updated_at > '#{params[:updated_at]}' and status=true order by row_order asc ")
      end

      def notify
        @banner_index = Banner.find_by_sql("select * from banners where status=true order by updated_at asc")
        if @banner_index.last.updated_at > (params[:updated_at]) or Magazine.order(updated_at: :asc).last.updated_at > (params[:updated_at])
          respond_to do |format|
            format.json { render :text => "Yes" }
          end
        elsif @banner_index.last.updated_at  < (params[:updated_at]) or Magazine.order(updated_at: :asc).last.updated_at < (params[:updated_at])
          respond_to do |format|
            format.json { render :text => "No" }
          end
        end
      end


      def banners_full_data
        respond_with @banner_index = Banner.find_by_sql("select banners.id, banners.name, banners.image, banners.created_at, banners.updated_at, banners.status,banners.row_order ,banners.site_link ,banners.start_date,banners.end_date from banners where status=true order by row_order asc ")
      end


      def show
        respond_with Banner.find(params[:id])
      end

      def create
        respond_with Banner.create(params[:banner])
      end

      def update
        respond_with Banner.update(params[:id], params[:banner])
      end

      def destroy
        respond_with Banner.destroy(params[:id])
      end

      private

      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end


    end
  end
end