class KeyholdersController < ApplicationController
  before_action :set_keyholder, only: [:show, :edit, :update, :destroy]

  # GET /keyholders
  # GET /keyholders.json
  def index
    @keyholders = Keyholder.all
  end

  # GET /keyholders/1
  # GET /keyholders/1.json
  def show
  end

  # GET /keyholders/new
  def new
    @keyholder = Keyholder.new
  end

  # GET /keyholders/1/edit
  def edit
  end

  # POST /keyholders
  # POST /keyholders.json
  def create
    @keyholder = Keyholder.new(keyholder_params)
    @user = current_user

    respond_to do |format|
      if @keyholder.save
        format.html { redirect_to @keyholder, notice: 'Keyholder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @keyholder }
      else
        format.html { render action: 'new' }
        format.json { render json: @keyholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keyholders/1
  # PATCH/PUT /keyholders/1.json
  def update
    respond_to do |format|
      if @keyholder.update(keyholder_params)
        format.html { redirect_to @keyholder, notice: 'Keyholder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @keyholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keyholders/1
  # DELETE /keyholders/1.json
  def destroy
    @keyholder.destroy
    respond_to do |format|
      format.html { redirect_to keyholders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyholder
      @keyholder = Keyholder.find(params[:id])
    end
    
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyholder_params
      params.require(:keyholder).permit(:username, :first_name, :last_name, :user_id, :house, :postcode, :keyholder)
    end
end
