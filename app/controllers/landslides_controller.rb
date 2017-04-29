class LandslidesController < ApplicationController
  def new
    @landslide = Landslide.new
  end

  def update
    @landslide = Landslide.find(params[:id])
  end

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
end