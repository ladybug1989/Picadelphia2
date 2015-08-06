class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  
  def index
    @photos = Photo.all
  end

  
  def show
  end

  def new
    @photo = current_user.photos.build
  end


  def edit
  end

 
  def create
    @photo = current_user.photos.build(photo_params)

  
      if @photo.save
      redirect_to @photo, notice: 'Photo was successfully created.' 
     
      else
       render :new 
       
      end
    end
 

 
  def update
   
      if @photo.update(photo_params)
       redirect_to @photo, notice: 'Photo was successfully updated.' 
        
      else
         render :edit 
     
      end
    end



  def destroy
    @photo.destroy
 
      redirect_to photos_url
     
    end
 

  private
   
    def set_photo
      @photo = Photo.find(params[:id])
    end
    #this makes sure that the user who is deleting and edit that Photoblog belongs to them, it will check see if the photoblog is yours if not you are back to the photos path
    def correct_user 
      @photo = current_user.photos.find_by(id: params[:id])
      redirect_to photos_path, notice: "Not Your PhotoBlog Dude, So You Cannot edit or delete this Photoblog." if @photo.nil?

    end 
  
    def photo_params
      params.require(:photo).permit(:content)
    end
end
