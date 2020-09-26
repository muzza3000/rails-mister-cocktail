class CocktailsController < ApplicationController
  def index

    if !params['search'].nil?
      @cocktails = Cocktail.where("lower(name) LIKE ?", "%#{params['search'].downcase}%")
    else
      @cocktails = Cocktail.all
    end
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params["id"])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktails_path
      # render :show
    end
  end

  def update
    byebug
    @cocktail = Cocktail.find(params['id'])
    if params["cocktail"].nil?
      # removes bug if the update button is selected without any ingredients
      return render :show
    end
    # raise
    @cocktail.update(cocktail_params)
    # @cocktail.photos.attach(params[:photos])
    # byebug
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params['id'])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :search, :photo, file: [], doses_attributes: [:id, :description, :ingredient_id, :_destroy])
  end
end
