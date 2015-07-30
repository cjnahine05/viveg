module Api
  module V1
    class PagesController < ApplicationController
      # http_basic_authenticate_with name: "admin", password: "secret"
      before_filter :restrict_access

      respond_to :json

      def index

        respond_with Page.find_by_sql("SELECT   coordinates.*, pages.id ,pages.magazine_id, pages.page_number ,pages.image,pages.status  FROM pages LEFT OUTER JOIN coordinates ON coordinates.page_id = pages.id WHERE  pages.status = true And pages.magazine_id IN  (#{params[:magazine_id]}) order by pages.id").uniq

      end
      def ios_pages

        respond_with Page.find_by_sql("SELECT   coordinates.*, pages.id ,pages.magazine_id, pages.page_number ,pages.image,pages.status  FROM pages LEFT OUTER JOIN coordinates ON coordinates.page_id = pages.id WHERE  pages.status = true And pages.magazine_id IN  (#{params[:magazine_id]}) order by pages.id").uniq


      end

      def test

        respond_with Page.find_by_sql("SELECT   coordinates.*, pages.id ,pages.magazine_id, pages.page_number ,pages.image,pages.status  FROM pages LEFT OUTER JOIN coordinates ON coordinates.page_id = pages.id WHERE  pages.status = true And pages.magazine_id IN  (#{params[:magazine_id]}) order by pages.id").uniq


      end

      def show
        respond_with Page.find(params[:id])
      end

      def create
        respond_with Page.create(params[:page])
      end

      def update
        respond_with Page.update(params[:id], params[:page])
      end

      def destroy
        respond_with Page.destroy(params[:id])
      end

      private

      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end


    end
  end
end