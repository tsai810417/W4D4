class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      flash[:success] = "Successfully added #{@band.name} to the list"
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    if @band
      render :show
    else
      render bands_url
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    band = Band.find(params[:id])
    band.update(band_params)
    flash[:success] = "Successfully updated"
    redirect_to bands_url
  end

  def destroy
    band = Band.find(params[:id])
    flash[:success] = "Successfully removed #{band.name}"
    band.delete
    redirect_to bands_url
  end


  def band_params
    params.require(:band).permit(:name)
  end

end
