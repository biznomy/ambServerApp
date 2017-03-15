class Admin::AddonsController < Admin::ApplicationController
  layout 'admin/application.html.erb'
  before_action :set_addon, only: [:show, :edit, :update, :destroy]
  # GET /addons
  def index
    @addons = Addon.list(params)
  end

  # GET /addons/1
  def edit
  end
  # GET /addons/new


  def new
    @addon = Addon.new
  end
  

  def create
    @addon = Addon.new(addon_params)
    respond_to do |format|
      if @addon.save
        format.html { redirect_to admin_addons_url, notice: 'Addon was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  # PATCH/PUT /addons/1
  def update
    respond_to do |format|
      if @addon.update(addon_params)
        format.html { redirect_to :controller => "addons", :action => "edit", :id =>@addon.id, notice: 'Addon was successfully updated.' }
     
      else
        format.html { render :edit }
      end
    end
  end


  # DELETE /addons/1
  def destroy
    @addon.destroy
    delete
  end


  def destroy_multiple
    Addon.destroy(params[:addons])
    delete
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_addon
    @addon = Addon.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def addon_params
    params.require(:addon).permit(:name)
  end

  def delete
    respond_to do |format|
     format.html { redirect_to admin_addons_url, notice: 'Addon was successfully destroyed.' }
    end
  end 
  
end
