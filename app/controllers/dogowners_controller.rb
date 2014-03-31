class DogownersController < ApplicationController
  def index
    @dogowners = Dogowner.all
  end

  def show
    @dogowner = Dogowner.find(params[:id])
  end

  def new
    @dogowner = Dogowner.new
  end

  def create
    @dogowner = Dogowner.create(dog_owner_params)
    if @dogowner.save
       redirect_to dogowner_path(@dogowner), notice: 'Dogowner created successfully'
    else
      render :new
    end
  end

  private

  def dog_owner_params
    params.require(:dogowner).permit(:first_name, :last_name, :email)
  end

end
