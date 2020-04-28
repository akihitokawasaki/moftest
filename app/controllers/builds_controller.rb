class BuildsController < ApplicationController
  before_action :set_build, only: [:show, :edit, :update, :destroy]

  
  def index
    @builds = Build.all
  end

  
  def show
  end

  
  def new
    @build = Build.new
    @station = 2.times{@build.stations.build}
  end

 
  def edit
    @station = 1.times{@build.stations.build}
  end

  
  def create
    @build = Build.new(build_params)

    respond_to do |format|
      if @build.save
        format.html { redirect_to @build, notice: 'Build was successfully created.' }
        format.json { render :show, status: :created, location: @build }
      else
        format.html { render :new }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @build.update(build_params)
        format.html { redirect_to @build, notice: 'Build was successfully updated.' }
        format.json { render :show, status: :ok, location: @build }
      else
        format.html { render :edit }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @build.destroy
    respond_to do |format|
      format.html { redirect_to builds_url, notice: 'Build was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_build
      @build = Build.find(params[:id])
    end

   
    def build_params
      params.require(:build).permit(:name, :rent, :address, :age, :remark, stations_attributes: [:route, :age, :property_id, :time, :id, :_destroy])

      
    end
end
