class UserController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    id = params[:id]
    history = History.find_by(id: id)
    render json: history
  end
  
  def index
    histories = History.find_by_user_id(current_user.id)
    render json: histories
  end
end
