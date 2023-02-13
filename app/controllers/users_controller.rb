class UsersController < ApplicationController
before_action :restrict_access, except: [:edit, :update, :delete]
before_action :check_user_id, only: [:edit,:update]
  def login

    @users = User.find_by(email: params[:email])
    if @users && @users.password_digest == params[:password_digest]
        session[:userid] = @users.id
      if @users.role == "admin"
        session[:current] = @users.role
        redirect_to spots_path, notice: "Logged in successfully as admin"
      elsif @users.role == "user"
        session[:current] = @users.role
        redirect_to new_customer_path, notice: "Logged in successfully as customer"
      end
    elsif !params[:email].present?
      render :login, status: :unprocessable_entity
    else
      flash.now[:alert] = "Incorrect uid or password"
      render :login, status: :unprocessable_entity
    end

  end
    def check_user_id
    if session[:current] != "admin"
        redirect_to edit_user_path(session[:userid]) unless session[:userid] == params[:id].to_i
     end
      end
  def index
  @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
  @users = User.find(params[:id])
  end
 def edit
    @users = User.find(params[:id])
  end
def update
    @users = User.find(params[:id])
      if @users.update(sess_params)
        redirect_to @users, notice: 'User was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
end
  def new
    @users = User.new

  end

  def create
    @users = User.new(sess_params)
        if @users.save
          redirect_to @users, notice: 'Park was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
  end


  def destroy
   @users = User.find(params[:id])
   @users.destroy
    redirect_to users_path, status: :see_other
  end
   def delete
     session.delete(:current)
     redirect_to login_path, notice: "Logged out successfully"

    end

    private

      def sess_params
        params.require(:user).permit( :name, :password_digest, :email, :role)
      end
end

