class ProfilesController < ApplicationController
    def edit
      @profile = current_user.profile
    end
  
    def update
      @profile = current_user.profile
      if @profile.update(profile_params)
        redirect_to root_path, notice: 'Perfil actualizado exitosamente'
      else
        render :edit
      end
    end
  
    private
  
    def profile_params
      params.require(:profile).permit(:photo, :bio)
    end
  end
  