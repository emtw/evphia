class FuneralsController < ApplicationController
  before_action :set_funeral, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /funerals
  # GET /funerals.json
  def index
  end

  # GET /funerals/1
  # GET /funerals/1.json
  def show
  end

  # GET /funerals/new
  def new
  end

  # GET /funerals/1/edit
  def edit
  end

  # POST /funerals
  # POST /funerals.json
  def create
    @user = current_user
    
    if current_user.funeral?
      flash[:notice] = "You have already set your funeral preferences."
      url_for :controller => "/users", :id => current_user.id, :action => 'myaccount'
    else
      @funeral.user_id = @user.id
  
      respond_to do |format|
        if @funeral.save
          format.html { redirect_to @funeral, notice: 'Funeral was successfully created.' }
          format.json { render action: 'show', status: :created, location: @funeral }
        else
          format.html { render action: 'new' }
          format.json { render json: @funeral.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /funerals/1
  # PATCH/PUT /funerals/1.json
  def update
    respond_to do |format|
      if @funeral.update(funeral_params)
        format.html { redirect_to @funeral, notice: 'Funeral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @funeral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funerals/1
  # DELETE /funerals/1.json
  def destroy
    @funeral.destroy
    respond_to do |format|
      format.html { redirect_to funerals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funeral
      @funeral = Funeral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funeral_params
      params.require(:funeral).permit(:funeral_pref, :casket_pref, :other_pref, :service_location, :burial_location, :ashes_location, :songs_pref, :readings, :speakers, :final_words, :dress_code, :flowers, :donations_to, :wake, :epitaph, :additional_reqs, :user_id)
    end
end
