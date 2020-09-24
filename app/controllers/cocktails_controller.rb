class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params["id"])
  end

  # def new
  #   @cocktail = Cocktail.new
  #   # @ingredients = Ingredient.all
  # end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :index
    end
  end

  def update
    @cocktail = Cocktail.find(params['id'])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
    # if @cocktail.save
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render :show
    # end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, doses_attributes: [:id, :description, :ingredient_id, :_destroy])
  end
end
