class UsersController < ApplicationController
    before_action :required_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil if @user == current_user
        redirect_to articles_path
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            redirect_to @user
        end
    end
end