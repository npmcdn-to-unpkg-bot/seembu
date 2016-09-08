class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show, :commercials, :residentials, :offices]

  # GET /projects
  # GET /projects.json
  def index

    # Conditional for current users
    if current_user.has_role?(:Professional)
      if user_signed_in? and current_user.profile.lname.blank? and current_user.profile.fname.blank?
        redirect_to edit_profile_path(current_user)
      end
    end

    @project_attachments = ProjectAttachment.all

    @search = Project.search(params[:q])
    @projects = @search.result.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_attachments = @project.project_attachments.all

    if @project.user.profile.reviews.blank?
      @average_reviews = 0
    else
      @average_reviews = @project.user.profile.reviews.average(:rating).round(2)
    end
  end

  # GET /projects/new
  def new

    # Conditional for current users
    if user_signed_in? and current_user.profile.lname.blank? and current_user.profile.fname.blank?
      redirect_to edit_profile_path(current_user), notice: "Please fill the required input."
    end

    @project = current_user.projects.build
    @project_attachment = @project.project_attachments.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        params[:project_attachments]['picture'].each do |a|
          @project_attachment = @project.project_attachments.create!(:picture => a)
        end
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Acts as votable 
  def upvote
    @project.upvote_from current_user
    redirect_to :back
  end

  #Additional Pages
  def commercials
    @commercials = Project.where(project_type: "Commercial").order("created_at DESC")
  end

  def residentials
    @residentials = Project.where(project_type: "Residential").order("created_at DESC")
  end

  def offices
    @offices = Project.where(project_type: "Office").order("created_at DESC")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :room, :location, :style, :size, :description, :project_type, :year_finished, :slug, project_attachments_attributes: [:id, :project_id, :picture])
    end
end
