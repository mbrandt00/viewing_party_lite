# frozen_string_literal: true

class UsersController < ApplicationController

  def new; end

  def show
    @user = User.find(params[:id])
    @invited = @user.user_viewing_parties
    @hosting = @user.viewing_parties
  end

  def create
    @user = User.create(user_params)
    if @user.save
    redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def login_form
  end

  def login_user
    if user = User.find_by(email: params[:email])
      if  user.authenticate(params[:password])
        redirect_to "/users/#{user.id}"
      else
        flash[:error] = "INVALID PASSWORD"
        redirect_to '/login'
      end
    else
      flash[:error] = "Email Not Found"
      redirect_to '/login'
    end

  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end


end
