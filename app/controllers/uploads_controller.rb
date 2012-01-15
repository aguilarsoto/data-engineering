class UploadsController < ApplicationController
  respond_to :html

  def index
    @uploads = Upload.all
    get_totals()
    respond_with(@uploads)
  end

  def show
    @upload = Upload.find(params[:id])
    get_totals()
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


private 

  def get_totals
    @partial = Upload.all.inject(0){|sum,item| sum + (item.partial ? item.partial : 0)}
    @total = Upload.valid.inject(0){|sum,item| sum + item.partial }
  end

end
