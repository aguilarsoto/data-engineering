class UploadsController < ApplicationController
  respond_to :html

  def index
    @uploads = Upload.all
    respond_with(@uploads)
  end

  def show
    @upload = Upload.find(params[:id])
    respond_with(@upload)
  end

  def new
    @upload = Upload.new
  end
 
  def create
    @upload = Upload.new(params[:upload])
    if @upload.save  
      flash[:notice] = "Successfully created product."  
    end    
    respond_with(@upload)  
  end


end
