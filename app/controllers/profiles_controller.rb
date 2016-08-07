class ProfilesController < ApplicationController
  
  before_action :set_profile, only: [:show, :edit, :update]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @projects = @profile.user.projects.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    @gallery = @profile.user.projects.order("created_at DESC")
  end


  # GET /profiles/1/edit
  def edit
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:fname, :lname, :address, :contactno, :service, :description, :avatar, :avatar_cache, :remove_avatar, :service_provided, :areas_served, :license_no, :awards, :sex, :occupation, :birthdate, :fbacc, :twacc, :website)
    end
end
