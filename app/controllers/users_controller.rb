class UsersController < ApplicationController
before_action :restrict_access, except: [:delete]
  def login

    @users = User.find_by(uid: params[:uid])
    if @users && @users.password_digest == params[:password_digest]

      if @users.role == "admin"
        session[:current] = @users.role

        redirect_to root_path, notice: "Logged in successfully as admin"
      elsif @users.role == "user"
        session[:current] = @users.role
        redirect_to new_customer_path, notice: "Logged in successfully as customer"
      end
    elsif !params[:uid].present?
      render :login, status: :unprocessable_entity
    else
      flash.now[:alert] = "Incorrect uid or password"
      render :login, status: :unprocessable_entity
    end

  end

  def index
  @users = User.all
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
        params.require(:user).permit(:uid, :name, :password_digest, :role)
      end
end

