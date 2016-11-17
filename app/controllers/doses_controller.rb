class DosesController < ApplicationController
  before_action :set_cocktail, only: [ :new, :create ]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = session[:cocktail_id]
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail["id"])
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
