class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
     @dogowner = Dogowner.all.map{ |c| [c.first_name, c.id] }
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dog_path(@dog), notice: "Dog registered successfully"
    else
      @dogowner = Dogowner.all.map{ |c| [c.first_name, c.id] }
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:owner_id, :dog_name)
  end


end
