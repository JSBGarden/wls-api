class LandslidesController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:search].present?
      @landslides = Landslide.near(params[:search], 50).page(params[:page]).per(10)
    else
      @landslides = Landslide.all.order("created_at desc").page(params[:page]).per(10)
    end
  end

  def new
    @landslide = Landslide.new
  end

  def show
    @landslide = Landslide.find(params[:id])
  end

  def create
    @landslide = Landslide.new(landslide_params)
    @landslide.user_id = current_user.id
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

    if @landslide.update_attributes(landslide_params)
      flash[:notice] = "Landslide data has been successfully updated"
    else
      flash[:error] = "Something went wrong"
    end

    redirect_to landslide_path(@landslide)
  end

  def destroy
    @landslide = Landslide.find(params[:id])
    @landslide.destroy

    redirect_to landslides_path
  end

  private

  def landslide_params
    params.require(:landslide).permit(:id, :hazard_type, :injuries, :landslide_size, :landslide_type, :latitude, :location_accuracy, :location_description,
                                :longitude, :near, :nearest_places, :trigger, :source_name, :address, landslide_images_attributes: [:id, :image, :_destroy])
  end
end