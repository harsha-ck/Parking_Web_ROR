# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_user_id, only: %i[edit update]
  before_action :set_user, only: %i[show edit update destroy reset passedit]
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.password_digest == params[:password_digest]
      session[:userid] = @user.id
      session[:current] = @user.role
      redirect_to new_customer_path, notice: "Logged in successfully as #{session[:current]}"

    elsif !params[:email].present?
      render :login, status: :unprocessable_entity
    else
      flash.now[:alert] = 'Incorrect uid or password'
      render :login, status: :unprocessable_entity
    end
  end

  def check_user_id
    return unless session[:current] != 'admin'

    redirect_to edit_user_path(session[:userid]) unless session[:userid] == params[:id].to_i
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
    authorize @users
  end

  def show
    authorize @user
  end

  def edit; end

  def update
    if @user.update(sess_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(sess_params)
    authorize @user
    if @user.save
      redirect_to @user, notice: 'Park was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  def delete
    session.delete(:current)
    redirect_to login_path, notice: 'Logged out successfully'
  end

  def forgot
    @user = User.find_by(email: params[:email])
    if @user.present?
      UserMailer.forgot(@user).deliver_now
      flash[:error] = "Reset Password link has been sent to '#{@user.email}'"

    elsif !params[:email].present?
      render :forgot, status: :unprocessable_entity
    else
      flash[:error] = 'Email does not exists'
      render :forgot, status: :unprocessable_entity
    end
  end

  def reset; end

  def passedit
    if @user.update(password_digest: params[:password_digest])
      redirect_to login_path, notice: 'User was successfully updated.'
    else
      render :forgot, status: :unprocessable_entity
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  private

  def sess_params
    params.require(:user).permit(:name, :password_digest, :email, :role)
  end
end
