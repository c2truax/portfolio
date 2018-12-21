class ProjectsController < ApplicationController
  skip_before_action :require_login, except: [:new,:create,:edit,:update,:destroy]
  def index
    @languagelist = "LANGUAGES: "
    @frameworklist = "FRAMEWORKS: "
    @databaselist = "DATABASES: "
    @otherlist = "OTHERS: "
    @projects = project_load
    @techlanguages = Tech.where(kind: "language")
    @techlanguages.each do |language|
      @languagelist = @languagelist + "#{language.name}, "
    end
    @languagelist = @languagelist.chop.chop
    @techframeworks = Tech.where(kind: "framework")
    @techframeworks.each do |framework|
      @frameworklist = @frameworklist + "#{framework.name}, "
    end
    @frameworklist = @frameworklist.chop.chop
    @techdatabases = Tech.where(kind: "database")
    @techdatabases.each do |database|
      @databaselist = @databaselist + "#{database.name}, "
    end
    @databaselist = @databaselist.chop.chop
    @techothers = Tech.where(kind: "other")
    @techothers.each do |other|
      @otherlist = @otherlist + "#{other.name}, "
    end
    @otherlist = @otherlist.chop.chop
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @teches = Tech.all
  end

  def create
    @project = Project.new(project_params)
    if @project.valid?
      @project.save
      params[:project][:tech_id].each do |tech_id|
        Utilize.create(project_id: @project.id, tech_id: tech_id)
      end
      return redirect_to "/projects/#{@project.id}"
    else
      flash[:errors] = @project.errors.full_messages
      return redirect_to '/projects/new'
    end
  end

  def edit
    @proj = Project.find(params[:id])
    @teches = Tech.all
    @utilized = @proj.utilized_tech
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      @project.save
      Utilize.where(project_id: @project.id).destroy_all
      params[:project][:tech_id].each do |tech_id|
        Utilize.create(project_id: @project.id, tech_id: tech_id)
      end
      return redirect_to "/projects/#{@project.id}"
    else
      flash[:errors] = @project.errors.full_messages
      return redirect_to "/projects/#{@project.id}/edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    Utilize.where(project_id: @project.id).destroy_all
    @project.destroy
    redirect_to "/projects"
  end

  private
    def project_params
      params.require(:project).permit(:title, :bio, :project_url, :image_url, :github_url, :description, :tech_id)
    end
end
