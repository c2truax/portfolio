class TechesController < ApplicationController
  def index
    @techlanguages = Tech.where(kind: "language")
    @techframeworks = Tech.where(kind: "framework")
    @techdatabases = Tech.where(kind: "database")
    @techothers = Tech.where(kind: "other")
  end

  def show
    @tech = Tech.find(params[:id])
  end

  def new
  end

  def create
    @tech = Tech.new(tech_params)
    if @tech.valid?
      @tech.save
      return redirect_to "/teches"
    else
      flash[:errors] = @tech.errors.full_messages
      return redirect_to '/teches/new'
    end
  end

  def edit
    @tech = Tech.find(params[:id])
  end

  def update
    @tech = Tech.find(params[:id])
    if @tech.update(tech_params)
      @tech.save
      return redirect_to "/teches"
    else
      flash[:errors] = @tech.errors.full_messages
      return redirect_to "/teches/#{@tech.id}/edit"
    end
  end

  def destroy
    Tech.find(params[:id]).destroy
    redirect_to "/teches"
  end

  private
    def tech_params
      params.require(:tech).permit(:name, :kind, :image_url)
    end
end
