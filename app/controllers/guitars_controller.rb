class GuitarsController < ApplicationController
  def index 
    @guitars = Guitar.all
    render :index
  end

  def show 
    @guitar = Guitar.find_by(id: params[:id])
    render :show
  end 

  def create 
    @guitar = Guitar.new(
      name: params[:name],
      price: params[:price],
      year: params[:year],
      image: params[:image]
    )
    @guitar.save
    render :show
  end

  def update 
    @guitar = Guitar.find_by(id: params[:id])
    @guitar.update( 
      name: params[:name] || @guitar.name,
      price: params[:price] || @guitar.price,
      year: params[:year] || @guitar.year,
      image: params[:image] || @guitar.image,
    )
    render :show
  end 

  def destroy 
    @guitar = Guitar.find_by(id: params[:id])
    @guitar.destroy
    render json: { message: 'Guitar post has been deleted'}
  end
end
