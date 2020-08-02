class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def login
  end

  def welcome
    @user = User.find(session[:user_id])
  end
end
