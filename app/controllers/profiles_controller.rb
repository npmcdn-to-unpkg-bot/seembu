class ProfilesController < ApplicationController
  
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show, :architects, :interior_designers, :design_firms, :architect_firms, :land_architects, :gen_contractors]

  # GET /profiles
  # GET /profiles.json
  def index
    @users = User.with_any_role(:Professional)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @projects = @profile.user.projects.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    @gallery = @profile.user.projects

    if @profile.reviews.blank?
      @average_reviews = 0
    else
      @average_reviews = @profile.reviews.average(:rating).round(2)
    end

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

  #Additional pages
  def architects
    @architects = Profile.where(service: "Architect")
  end

  def interior_designers
    @intdesigners = Profile.where(service: "Interior Designer")
  end

  def architect_firms
    @archfirms = Profile.where(service: "Architectural Firm")
  end

  def intdesign_firms
    @intdesfirms = Profile.where(service: "Interior Designing Firm")
  end

  def design_firms
    @desfirms = Profile.where(service: "Design & Build Firm")
  end

  def land_architects
    @landarchs = Profile.where(service: "Landscape Architect")
  end

  def gen_contractors
    @genconts = Profile.where(service: "General Contractor")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:fname, :lname, :address, :contactno, :service, :description, :avatar, :avatar_cache, :remove_avatar, :service_provided, :areas_served, :license_no, :awards, :sex, :occupation, :birthdate, :fbacc, :twacc, :website, :firmname)
    end
end
