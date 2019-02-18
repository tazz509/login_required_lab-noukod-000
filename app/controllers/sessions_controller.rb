class SessionsController < ApplicationController
  def index
    redirect_to "/login" unless current_user
  end

  def new
  end

  def create
    return redirect_to "/login" if !params[:name] || params[:name].empty?
    session[:name] = params[:name]
    redirect_to '/'
    # binding.pry
  end

  def destroy
    session.delete :name if current_user
    redirect_to controller: 'sessions', action: new
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :name
  end
end
