class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def destroy
    @cocktail = Cocktail.destroy(params[:id])
    redirect_to cocktails_path
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    ingredients = params[:cocktail][:ingredient_ids].reject(&:blank?)
    @cocktail = Cocktail.create(cocktail_params)
    ingredients.each do |ingredient|
      Dose.create( cocktail_id: @cocktail.id, ingredient_id:
      ingredient)
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
