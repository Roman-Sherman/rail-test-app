class Api::MasterController < ApplicationController
    
  # GET /api/master/format
  def allformat
    render json: MasterService::FindAllFormat.call()
  end

  # GET /api/master/category
  def allcategory
    render json: MasterService::FindAllCategory.call()
  end

end
