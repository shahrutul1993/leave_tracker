class LeaveController < ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:create]


  # GET /leaves
  # GET /leaves.json
  def index
    @leave = current_user.leaves.all
  end

  # GET /leaves/1
  # GET /leaves/1.json
  def show
  end

  # GET /leaves/new
  def new
    @leave = Leave.new
  end

  # GET /leaves/1/edit
  def edit
  end

  # POST /leaves
  # POST /leaves.json
  def create
    if current_user.nil?
      session[:form_data] = leave_params
      redirect_to new_user_registration_path
    else
    @leave = Leave.new(leave_params)
    @leave.user_id = current_user.id
    respond_to do |format|
      if @leave.save
        format.html { redirect_to}
        format.json { render :show, status: :created, location: @leave }
      else
        format.html { render :new }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end

    end
   end 
  end

  # PATCH/PUT /leaves/1
  # PATCH/PUT /leaves/1.json
  def update 
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to @leave, notice: 'Leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave }
      else
        format.html { render :edit }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leave.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url, notice: 'Leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave
      @leave = Leave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_params
      params.require(:leave).permit(:title, :start_date, :end_date, :no_of_days, :reason, :user_id)
    end


    
end
