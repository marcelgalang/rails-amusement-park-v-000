class SessionsController < ApplicationController

    def destroy
      session.clear
      redirect_to root_url
    end

    def new
      @user = User.new
    end

    def create   #removed 5 @user
      @user = User.find_by(name: params[:user][:name])  #|| @user = User.new
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end
