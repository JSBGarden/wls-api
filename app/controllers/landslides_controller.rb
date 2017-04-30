class LandslidesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @landslide = current_user.landslides.new
  end

  def index
    if params[:search].present?
      @landslides = Landslide.near(params[:search], 50).page(params[:page]).per(10)
    else
      @landslides = Landslide.all.order("created_at desc").page(params[:page]).per(10)
    end
  end

  def show
    @landslide = Landslide.find(params[:id])
  end

  def create
    @landslide = current_user.landslides.new(landslide_params)
    if @landslide.save
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: '+9779840061046',
        body: "A #{@landslide.landslide_size} landslide has occurred near #{@landslide.address}."
      )
      flash[:success] = "Landslide data has been successfully added."
      redirect_to landslides_path
    else
      flash[:error] = "Something went wrong."
      render 'new'
    end
  end

  def edit
    @landslide = Landslide.find(params[:id])
    check_can_modify(@landslide)
  end

  def update
    @landslide = Landslide.find(params[:id])
    check_can_modify(@landslide)
    respond_to do |format|
      if @landslide.update_attributes(landslide_params)
        format.json {
          render "show"
        }
      else
        format.json { render :json => { :errors => @landslide.errors },  :status => :unprocessable_entity }
      end
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
    params.require(:landslide).permit(:id, :hazard_type, :injuries, :fatalities, :landslide_size, :landslide_type, :latitude, :location_accuracy, :location_description,
                                :longitude, :near, :nearest_places, :trigger, :source_name, :address, :countrycode, :tstamp, landslide_images_attributes: [:id, :image, :_destroy])
  end

  def check_can_modify(landslide)
    unless landslide.user == current_user
      flash[:error] = "Something went wrong"
      redirect_to landslides_path
    end
  end

end