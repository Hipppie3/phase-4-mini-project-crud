class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :spice_not_found

 def index
  spice = Spice.all
  render json: spice
 end

  def create 
  spice = Spice.create(spice_params)
  render json: spice, status: :created
 end

 def update
  spice = spice_by_id
  if spice
   spice.update(rating: params[:rating])
   render json: spice
  else
   spice_not_found
  end
 end

 def destroy
  spice = spice_by_id
  if spice
   spice.destroy
   head :no_content
  else
   spice_not_found
  end
 end


 private
 def spice_params
  params.permit(:title, :image, :description, :notes, :rating)
 end

 def spice_by_id
  Spice.find(params[:id])
 end

 def spice_not_found
  render json: { error: "Spice not found" }, status: :not_found
 end

end
