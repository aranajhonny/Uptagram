class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
         @photos= Photo.all.order("created_at DESC")
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @categories = Category.all
  end

  def create
    @photo = Photo.new(photo_params.merge(user: current_user)) 
    @photo.categories = params[:categories] 
    # add @photo.user == current_user
      if @photo.save
        flash[:success] = "Posted!"
        redirect_to photos_path
      else
        render :new
      end
  end

  def like
    @photo = Photo.find(params[:id])
    like = Like.create(like: params[:like], user: current_user, photo: @photo) #change user to current_user
    if like.valid?
      flash[:success] = "Your selection was successful!"
    else 
      flash[:danger] = "You can only like/dislike a photo once."
    end
      redirect_to :back
  end

  private

    def photo_params
      params.require(:photo).permit(:image,:categories)
    end

end
