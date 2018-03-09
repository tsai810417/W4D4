class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def create
    album = Album.new(album_params)
    if album.save!
      flash[:secess] = "Successfully added #{album.title}"
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    if @album
      render :edit
    else
      flash[:error] = "Album not exist"
      redirect_to albums_url
    end
  end

  def show
    @album = Album.find(params[:id])
    if @album
      render :show
    else
      flash[:error] = "Album not exist"
      redirect_to albums_url
    end
  end

  def update
    album = Album.find(params[:id])
    if album.update(album_params)
      flash[:sucess] = "Successfully updated"
    else
      flash[:errors] = album.errors.full_messages
      redirect_to edit_album(album)
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.delete
    flash[:sucess] = "#{album.title} was removed"
    redirect_to albums_url
  end


  private
  def album_params
    params.require(:album).permit(:band_id, :year, :title, :live, :studio, :record_id)
  end
end
