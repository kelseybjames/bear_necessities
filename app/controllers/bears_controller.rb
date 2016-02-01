class BearsController < ApplicationController

  def index
    @bears = Bear.all
  end

  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(whitelisted_params)
    if @bear.save
      flash[:success] = 'Bear created'
      redirect_to bear_path(@bear)
    else
      flash[:error] = 'Failed to create bear'
      redirect_to index
    end
  end

  def show
    @bear = Bear.find(params[:id])
  end

  def edit
    @bear = Bear.find(params[:id])
  end

  def update
    @bear = Bear.find(params[:id])
    if @bear.update(whitelisted_params)
      redirect_to bears_path
      flash[:success] = "Bear updated"
    else
      render 'edit'
      flash.now[:error] = "Failed to update bear"
    end
  end

  def destroy
    @bear = Bear.find(params[:id])
    if @bear.destroy
      redirect_to bears_path
      flash[:success] = "Bear deleted"
    else
      redirect_to bears_path
      flash[:error] = "Failed to delete bear"
    end
  end

  private

  def whitelisted_params
    params.require(:bear).permit(:name, :description)
  end
end
