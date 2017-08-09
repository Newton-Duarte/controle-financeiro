class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)

    if @category.save
      redirect_to categories_path, notice: "Conta criada com sucesso!"
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @category.update(params_category)
      redirect_to categories_path, notice: "Conta atualizada com sucesso!"
    else
      render :edit
    end

  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: "Conta excluída com sucesso!"
    else
      render :index
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:id, :description)
  end
end
