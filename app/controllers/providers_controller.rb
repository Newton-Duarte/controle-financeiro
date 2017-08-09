class ProvidersController < ApplicationController

  before_action :set_provider, only: [:edit, :update, :destroy]

  def index
    @providers = Provider.all
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(params_provider)

    if @provider.save
      redirect_to providers_path, notice: "Cliente criado com sucesso!"
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @provider.update(params_provider)
      redirect_to providers_path, notice: "Cliente atualizado com sucesso!"
    else
      render :edit
    end

  end

  def destroy
    if @provider.destroy
      redirect_to providers_path, notice: "Cliente excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def params_provider
    params.require(:provider).permit(:id, :provider_type, :cpf_cnpj, :nome_razao_social, :apelido_fantasia)
  end

end
