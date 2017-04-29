module Api
  module V1
    class Users::LandslidesController < ApplicationController
      # before_filter :restrict_access

      # respond_to :json
      protect_from_forgery with: :null_session

      def index
        @landslides = Landslide.all
      end

      def show
        @landslide = Landslide.find(params[:id])
      end

      def create
        @landslide = Landslide.new(landslide_params)
        # @landslide.user_id = current_user.id

        respond_to do |format|
          if @landslide.save

            format.json {
              render "show"
            }
          else
            puts @landslide.errors
            format.json { render :json => { :errors => @landslide.errors },  :status => :unprocessable_entity }
          end
        end
      end


      def update
        @landslide = Landslide.find(params[:id])

        respond_to do |format|
          if @landslide.update_attributes(landslide_params)
            format.json {
              render "show"
            }
          else
            format.json { render :json => { :errors => @landslide.errors },  :status => :unprocessable_entity }
          end
        end

      end

      def destroy
        respond_with Landslide.destroy(params[:id])
      end

      private
      # def current_seller
      #   Seller.find_by_authentication_token(request.headers["X-AUTHENTICATION-TOKEN"])
      # end

      # def restrict_access
      #   seller = Seller.find_by_authentication_token(request.headers["X-AUTHENTICATION-TOKEN"])
      #   head :unauthorized unless seller
      # end

      def landslide_params
        params.require(:landslide).permit(:id, :hazard_type, :injuries, :landslide_size, :landslide_type, :latitude, :location_accuracy, :location_description,
                                :longitude, :near, :nearest_places, :trigger, :source_name)
      end

    end
  end
end

