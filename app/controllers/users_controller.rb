class UsersController < ApplicationController
  respond_to :html, :json
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_by_phone, only: [:login, :receipientRegistered]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users/login.json
  def login
    # This method verifies the users credential, and returns 200 status code
    # if credential is valid otherwise 401 status code.
    logger.info " ------- users/login user : #{@user}"
    respond_to do |format|
      if @user and @user.password == params[:password]
        format.json { head :ok }
      else        
        error_msg = { :error => "Wrong credential. Please check your credential"}
        format.json { render json: error_msg, status: :forbidden } #:unauthorized
      end
    end
  end

  # POST /users/receipientRegistered.json
  def receipientRegistered
    # This method verifies the phoneNumber whether the given phone number 
    # is registered with ETA service.
    logger.info " ------ /users/receipientRegistered.json, user : #{@user}"
    respond_to do |format|
      if @user
        format.json { head :ok }
      else
        error_msg = { :error => "User(#{params[:phoneNumber]}) is not registered with ETA" }
        format.json { render json: error_msg, status: :not_found }
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
   
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    logger.info " -------- user/create : #{user_params}"
    logger.info " -------- phoneNumber : #{user_params[:phoneNumber]}"
    @user = User.find_by_phoneNumber(user_params[:phoneNumber])

    unless @user.nil?
      # If user already exists then return conflict error.
      # If client registration id is different then
      # update it.
      if @user.clientRegistrationId != user_params[:clientRegistrationId]
        @user.update_column(:clientRegistrationId, user_params[:clientRegistrationId])
      end
      respond_to do |format|
        error_msg = { :error => "User(#{user_params[:phoneNumber]}) is already registered with ETA" }
        format.json { render json: error_msg, status: :conflict }
      end
    else 
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          # format.json { render action: 'show', status: :created, location: @user }
          format.json { head :created } 
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_user_by_phone
      @user = User.find_by_phoneNumber(params[:phoneNumber])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :phoneNumber, :clientRegistrationId)
    end

end
