class LandslidesController < ApplicationController
  def new
    @landslide = Landslide.new
  end

  def index
    @landslides = Landslide.all.order("created_at desc").page(params[:page]).per(10)
  end

  def show
    @landslide = Landslide.find(params[:id])
  end

  def create
    @landslide = Landslide.new(landslide_params)
    if @landslide.save
      flash[:success] = "Landslide data has been successfully added."
      redirect_to landslides_path
    else
      flash[:error] = "Something went wrong."
      render 'new'
    end
  end

  def edit
    @landslide = Landslide.find(params[:id])
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

  def landslide_params
    params.require(:landslide).permit(:id, :hazard_type, :injuries, :landslide_size, :landslide_type, :latitude, :location_accuracy, :location_description,
                                :longitude, :near, :nearest_places, :trigger, :source_name)
  end
end