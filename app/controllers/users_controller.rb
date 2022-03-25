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
      redirect_to(user_path(@user), success: 'The user was created successfully.')
    else 
      flash[:danger] = @user.errors.full_messages
      redirect_to('/register')
    end
  end

  def discover
    @user = User.find(params[:id])
  end
  private

  def user_params
    params.permit(:name, :email)
  end


end
