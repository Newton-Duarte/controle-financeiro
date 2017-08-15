class ProfilesController < ApplicationController

  before_action :set_profile, only: [:edit, :update]

  def edit
  end

  def update
    if @profile.update(params_profile)
      redirect_to edit_profile_path(current_user.id), notice: "Perfil atualizado com sucesso!"
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = UserProfile.find_or_create_by(user_id: current_user.id)
  end

  def params_profile
    params.require(:user_profile).permit(:id, :first_name, :last_name)
  end
end
