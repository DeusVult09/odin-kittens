class KittensController < ApplicationController

  def new
    @kitten = Kitten.new
  end

  def index
    @kittens = Kitten.all
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kittens
    else
      redirect_to :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @kitten.destroy

    redirect_to @kitten, notice: "Kitten was successfully deleted"
  end

  private
  def kitten_params
     params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
